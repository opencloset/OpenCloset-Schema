package OpenCloset::FilterColumn;
# ABSTRACT: OpenCloset Database Schema Class

use strict;
use warnings;

our $VERSION = '0.037';

use base qw(DBIx::Class);
use SQL::Abstract 'is_literal_value';

=method register_column

=cut

sub register_column {
    my ( $self, $column, $info, @rest ) = @_;

    $self->next::method( $column, $info, @rest );

    return unless $info->{data_type} eq 'decimal';

    $self->filter_column(
        cuff => {
            filter_to_storage   => 'to_cm',
            filter_from_storage => 'from_cm',
        }
    );
}

=method filter_column

=cut

sub filter_column {
    my ( $self, $col, $attrs ) = @_;

    my $colinfo = $self->column_info($col);

    $self->throw_exception(
        "FilterColumn can not be used on a column with a declared InflateColumn inflator")
        if defined $colinfo->{_inflate_info}
        and $self->isa('DBIx::Class::InflateColumn');

    $self->throw_exception("No such column $col to filter")
        unless $self->has_column($col);

    $self->throw_exception('filter_column expects a hashref of filter specifications')
        unless ref $attrs eq 'HASH';

    $self->throw_exception(
        'An invocation of filter_column() must specify either a filter_from_storage or filter_to_storage'
    ) unless $attrs->{filter_from_storage} || $attrs->{filter_to_storage};

    $colinfo->{_filter_info} = $attrs;
    my $acc = $colinfo->{accessor};
    $self->mk_group_accessors(
        filtered_column => [ ( defined $acc ? $acc : $col ), $col ] );
    return 1;
}

=method _column_from_storage

=cut

sub _column_from_storage {
    my ( $self, $col, $value ) = @_;

    return $value if is_literal_value($value);

    my $info = $self->result_source->column_info($col)
        or $self->throw_exception("No column info for $col");

    return $value unless exists $info->{_filter_info};

    my $filter = $info->{_filter_info}{filter_from_storage};

    return defined $filter ? $self->$filter($value) : $value;
}

=method _column_to_storage

=cut

sub _column_to_storage {
    my ( $self, $col, $value ) = @_;

    return $value if is_literal_value($value);

    my $info = $self->result_source->column_info($col)
        or $self->throw_exception("No column info for $col");

    return $value unless exists $info->{_filter_info};

    my $unfilter = $info->{_filter_info}{filter_to_storage};

    return defined $unfilter ? $self->$unfilter($value) : $value;
}

=method get_filtered_column

=cut

sub get_filtered_column {
    my ( $self, $col ) = @_;

    $self->throw_exception("$col is not a filtered column")
        unless exists $self->result_source->column_info($col)->{_filter_info};

    return $self->{_filtered_column}{$col}
        if exists $self->{_filtered_column}{$col};

    my $val = $self->get_column($col);

    return $self->{_filtered_column}{$col} = $self->_column_from_storage( $col, $val );
}

=method get_column

=cut

sub get_column {
    my ( $self, $col ) = @_;

    if ( exists $self->{_filtered_column}{$col} ) {
        return $self->{_column_data}{$col} ||=
            $self->_column_to_storage( $col, $self->{_filtered_column}{$col} );
    }

    return $self->next::method($col);
}

=method get_columns

=cut

sub get_columns {
    my $self = shift;

    $self->{_column_data}{$_} =
        $self->_column_to_storage( $_, $self->{_filtered_column}{$_} )
        for grep { !exists $self->{_column_data}{$_} }
        keys %{ $self->{_filtered_column} || {} };

    $self->next::method(@_);
}

=method store_column

=cut

sub store_column {
    my ( $self, $col ) = ( shift, @_ );

    # blow cache
    delete $self->{_filtered_column}{$col};

    $self->next::method(@_);
}

=method has_column_loaded

=cut

sub has_column_loaded {
    my ( $self, $col ) = @_;
    return 1 if exists $self->{_filtered_column}{$col};
    return $self->next::method($col);
}

=method set_filtered_column

=cut

sub set_filtered_column {
    my ( $self, $col, $filtered ) = @_;

    # unlike IC, FC does not need to deal with the 'filter' abomination
    # thus we can short-curcuit filtering entirely and never call set_column
    # in case this is already a dirty change OR the row never touched storage
    if (  !$self->in_storage
        or $self->is_column_changed($col) )
    {
        $self->make_column_dirty($col);
        delete $self->{_column_data}{$col};
    }
    else {
        $self->set_column( $col, $self->_column_to_storage( $col, $filtered ) );
    }

    return $self->{_filtered_column}{$col} = $filtered;
}

=method update

=cut

sub update {
    my ( $self, $data, @rest ) = @_;

    my $colinfos = $self->result_source->columns_info;

    foreach my $col ( keys %{ $data || {} } ) {
        if ( exists $colinfos->{$col}{_filter_info} ) {
            $self->set_filtered_column( $col, delete $data->{$col} );

            # FIXME update() reaches directly into the object-hash
            # and we may *not* have a filtered value there - thus
            # the void-ctx filter-trigger
            $self->get_column($col) unless exists $self->{_column_data}{$col};
        }
    }

    return $self->next::method( $data, @rest );
}

=method new

=cut

sub new {
    my ( $class, $data, @rest ) = @_;

    my $rsrc = $data->{-result_source}
        or $class->throw_exception(
        'Sourceless rows are not supported with OpenCloset::FilterColumn');

    my $obj = $class->next::method( $data, @rest );

    my $colinfos = $rsrc->columns_info;

    foreach my $col ( keys %{ $data || {} } ) {
        if ( exists $colinfos->{$col}{_filter_info} ) {
            $obj->set_filtered_column( $col, $data->{$col} );
        }
    }

    return $obj;
}

=method to_cm

cm to inch

=method from_cm

inch to cm

=cut

sub to_cm   { $_[1] ? sprintf( '%.2f', $_[1] * 2.54 )      : undef }
sub from_cm { $_[1] ? sprintf( '%.2f', $_[1] * 100 / 254 ) : undef }

1;

# COPYRIGHT

__END__
