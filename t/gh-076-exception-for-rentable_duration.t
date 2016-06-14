use Test::More;

use strict;
use warnings;
use DateTime;

my $time_zone       = "Asia/Seoul";
my $now_dt          = DateTime->now( time_zone => $time_zone );
my $system_start_dt = DateTime->new(
    year      => 2014,
    month     => 12,
    day       => 17,
    time_zone => $time_zone,
);

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
            [ 3, 1, $now_dt->clone->add( days => -30 )->ymd ],
            [ 4, 1, $now_dt->clone->add( days => 8 )->ymd ],
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

## Your testing code below ##

subtest "clothes.warehousing_date(): after system start date", sub {
    my $code = "0J0H1";
    my $ymd  = "2015-03-15";
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    my $warehousing_dt = $clothes->warehousing_date( $time_zone, $system_start_dt );
    is $warehousing_dt->ymd, $ymd => "clothes.warehousing_date";
};

subtest "clothes.warehousing_date(): before system start date", sub {
    my $code = "0J0H2";
    my $ymd  = "2014-12-17";
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    my $warehousing_dt = $clothes->warehousing_date( $time_zone, $system_start_dt );
    is $warehousing_dt->ymd, $ymd => "clothes.warehousing_date";
};

subtest "clothes.rentable_duration(): 1 month earlier than today", sub {
    my $code = "0J0H3";
    my $days = 30;
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    is $clothes->rentable_duration( $now_dt, $system_start_dt ),
        $days => "clothes.rentable_duration";
};

subtest "clothes.rentable_duration(): warehousing date is earlier than today", sub {
    my $code = "0J0H4";
    my $days = -8;
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    is $clothes->rentable_duration( $now_dt, $system_start_dt ),
        $days => "clothes.rentable_duration";
};

## Your testing code above ##

done_testing;
