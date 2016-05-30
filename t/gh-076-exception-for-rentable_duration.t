use Test::More;

use strict;
use warnings;
use DateTime;

my $now = DateTime->now( time_zone => "Asia/Seoul" );

use Test::DBIx::Class {
    schema_class => "OpenCloset::Schema",
    connect_info => [ "dbi:SQLite:dbname=:memory:", "", "" ],
    connect_opts  => { quote_char => q{`}, },
    fixture_class => "::Populate",
    },
    "Donation", "Clothes";

fixtures_ok(
    [
        Donation => [
            [qw/id user_id create_date/],
            [ 1, 1, "2015-03-15 13:00:34" ],
            [ 2, 1, "2014-11-15 23:12:34" ],
            [ 3, 1, $now->clone->add( days => -30 )->ymd ],
            [ 4, 1, $now->clone->add( days => 8 )->ymd ],
        ],
        Clothes => [
            [qw/id code donation_id category/],
            [ 6341, "0J0H1", 1, "jacket" ],
            [ 6342, "0J0H2", 2, "jacket" ],
            [ 6343, "0J0H3", 3, "jacket" ],
            [ 6344, "0J0H4", 4, "jacket" ],
        ],
    ],
    "Installed fixtures",
);

my $system_start_date = {
    year      => 2014,
    month     => 12,
    day       => 17,
    time_zone => 'Asia/Seoul',
};

## Your testing code below ##

subtest "clothes.warehousing_date(): after system start date", sub {
    my $code = "0J0H1";
    my $ymd  = "2015-03-15";
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    my $warehousing_date = $clothes->warehousing_date($system_start_date);
    is $warehousing_date->ymd, $ymd => "clothes.warehousing_date";
};

subtest "clothes.warehousing_date(): before system start date", sub {
    my $code = "0J0H2";
    my $ymd  = "2014-12-17";
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    my $warehousing_date = $clothes->warehousing_date($system_start_date);
    is $warehousing_date->ymd, $ymd => "clothes.warehousing_date";
};

subtest "clothes.rentable_duration(): 1 month earlier than today", sub {
    my $code = "0J0H3";
    my $days = 30;
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    is $clothes->rentable_duration( $system_start_date, 'Asia/Seoul' ),
        $days => "clothes.rentable_duration";
};

subtest "clothes.rentable_duration(): warehousing date is earlier than today", sub {
    my $code = "0J0H4";
    my $days = -8;
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    is $clothes->rentable_duration( $system_start_date, 'Asia/Seoul' ),
        $days => "clothes.rentable_duration";
};

## Your testing code above ##

done_testing;
