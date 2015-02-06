package OpenCloset::Schema::Base;
# ABSTRACT: OpenCloset Database Schema Class

use strict;
use warnings;

our $VERSION = '0.004';

use base 'DBIx::Class::Core';

__PACKAGE__->load_components(
    qw(
        EncodedColumn
        InflateColumn::DateTime
        TimeStamp
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
