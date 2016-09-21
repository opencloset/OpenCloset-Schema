package OpenCloset::Schema::ResultSet::Order;

use strict;
use warnings;

use base 'DBIx::Class::ResultSet';
use DateTime;
use List::Util qw/none/;

sub offline {
    my $self   = shift;
    my $search = shift // {};
    my $attr   = shift // {};
    my $me     = $self->current_source_alias;

    my $dt_base = DateTime->new(
        year      => 2015,
        month     => 5,
        day       => 29,
        time_zone => 'Asia/Seoul',
    );
    my $dtf  = $self->result_source->schema->storage->datetime_parser;
    my %cond = (
        -or => [
            {
                # 대여일이 2015-05-29 이전은 19시 이전
                -and => [
                    { 'booking.date'            => { '<' => $dtf->format_datetime($dt_base) }, },
                    \[ "HOUR(booking.date) < ?" => 19 ],
                ],
            },
            {
                # 대여일이 2015-05-29 이후는 22시 이전
                -and => [
                    { 'booking.date'            => { '>=' => $dtf->format_datetime($dt_base) }, },
                    \[ "HOUR(booking.date) < ?" => 22 ],
                ],
            },
        ],
        %{$search}
    );

    push @{ $attr->{join} }, 'booking' if none { $_ eq 'booking' } @{ $attr->{join} };
    push @{ $attr->{prefetch} }, 'booking'
        if none { $_ eq 'booking' } @{ $attr->{prefetch} };

    $self->search( { %cond, %{$search} }, { %{$attr} } );
}

1;
