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
        [ 3, 1, $now->clone->add( days => 8 )->ymd ],
    ],
    Clothes => [
        [qw/id code donation_id category/],
        [ 6343, '0J0H3', 1, 'jacket' ],
        [ 6344, '0J0H4', 2, 'jacket' ],
        [ 6345, '0J0H5', 3, 'jacket' ],
    ],
    ],
    'Installed fixtures';

## Your testing code below ##

subtest "entry_date is earlier than now (abnormal case)", sub {
    ok my $clothes = Clothes->find( { code => '0J0H5' } ) => "find clothes.code";
    ok my $entry_date = $clothes->donation->create_date => "get entry_date";
    ok my $delta =
        $entry_date->delta_days($now)->in_units('days') => "get delta from now";

    diag( "entry_date : ", $entry_date );
    diag( "       now : ", $now );
    is $clothes->rentable_duration,
        -8 => "calcurated rentable_duration : " . $clothes->rentable_duration;
};

subtest "entry_date is earlier than today (normal case)", sub {
    ok my $clothes = Clothes->find( { code => '0J0H3' } ) => "find clothes.code";
    ok my $entry_date = $clothes->donation->create_date => "get entry_date";
    ok my $delta =
        $entry_date->delta_days($now)->in_units('days') => "get delta from now";

    diag( "entry_date : ", $entry_date );
    diag( "       now : ", $now );
    is $clothes->rentable_duration,
        $delta => "calcurated rentable_duration : " . $clothes->rentable_duration;
};

subtest "entry_date is earlier than today and system start date (normal case)", sub {
    ok my $clothes = Clothes->find( { code => '0J0H4' } ) => "find clothes.code";
    ok my $entry_date = $clothes->donation->create_date => "get entry_date";
    ok my $base_dt = DateTime->new( year => 2014, month => 12, day => 17 ) =>
        "system start date : 2014-12-17";
    ok my $delta =
        $base_dt->delta_days($now)->in_units('days') => 'get delta from $base_dt';

    diag( "entry_date : ", $entry_date );
    diag( " base_date : ", $base_dt );
    diag( "       now : ", $now );
    is $clothes->rentable_duration,
        $delta => "calcurated rentable_duration : " . $clothes->rentable_duration;
};

## Your testing code above ##

done_testing;
