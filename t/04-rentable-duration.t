use Test::More;

use strict;
use warnings;
use DateTime;

my $now = DateTime->now()->truncate( to => 'day' );

use Test::DBIx::Class {
    schema_class => 'OpenCloset::Schema',
    connect_info => [ 'dbi:SQLite:dbname=:memory:', '', '' ],
    connect_opts  => { quote_char => q{`}, },
    fixture_class => '::Populate',
    },
    'Donation', 'Clothes';

fixtures_ok [
    Donation => [
        [qw/id user_id create_date/],
        [ 1, 1, '2016-04-29 03:51:50' ],
        [ 2, 1, '2011-07-04 00:00:00' ],
        [ 3, 1, $now->clone->add( days => 8 )->ymd ]
    ],
    Clothes => [
        [qw/id code donation_id category/],
        [6343, '0J0H3', 1, 'jacket' ],
        [6344, '0J0H4', 2, 'jacket' ],
        [6345, '0J0H5', 3, 'jacket' ]
    ],
], 'Installed fixtures';

## Your testing code below ##

{
    my $dt = DateTime->new( year => 2016, month => 4, day => 29 );
    my $delta = $dt->delta_days($now)->in_units('days');

    my $clothes = Clothes->find({code=>'0J0H3'});
    is $clothes->rentable_duration(), $delta => "ENTRY : $dt / RETURN: $now / rented duration: $delta";
}

{
    my $dt      = DateTime->new( year => 2011, month => 7, day => 4 );
    my $base_dt = DateTime->new( year => 2014, month => 12, day => 17 );
    my $delta = $base_dt->delta_days($now)->in_units('days');

    my $clothes = Clothes->find( { code => '0J0H4' } );
    is $clothes->rentable_duration(),
        $delta => "ENTRY : $dt / RETURN: $now / rented duration: $delta (baseline $base_dt)";
}

{
    my $dt = $now->clone->add( days => 8 );
    my $delta = $dt->delta_days($now)->in_units('days');

    my $clothes = Clothes->find( { code => '0J0H5' } );
    is $clothes->rentable_duration(), -8 => "ENTRY : $dt / RETURN: $now / rented duration: -8";
}

## Your testing code above ##

done_testing;
