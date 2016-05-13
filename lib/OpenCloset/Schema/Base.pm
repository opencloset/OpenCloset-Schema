package OpenCloset::Schema::Base;
# ABSTRACT: OpenCloset Database Schema Class

use strict;
use warnings;

our $VERSION = '0.033';

use base 'DBIx::Class::Core';

### *WARN* FilterColumn 을 TimeStamp 위에 두면 안됨
###
### https://metacpan.org/pod/distribution/DBIx-Class/lib/DBIx/Class/Manual/Component.pod#USING
### The order in which is you load the components may be very important, depending on the component. If you are not sure, then read the docs for the components you are using and see if they mention anything about the order in which you should load them.

__PACKAGE__->load_components(
    qw(
        EncodedColumn
        InflateColumn::DateTime
        TimeStamp
        FilterColumn
        )
);

use overload '""' => sub {
    my $self = shift;
    my %data = $self->get_columns;
    my $line = "------------------------------";
    my $out  = "$line\n";
    my $max  = 0;

    for my $key ( sort keys %data ) {
        my $len = length $key;
        $max = $len if $len > $max;
    }

    for my $key ( sort { length $a <=> length $b } keys %data ) {
        $out .= sprintf( "%*s: %s\n", $max, $key, $data{$key} // '' );
    }

    return "$out$line";
};

1;

# COPYRIGHT

__END__
