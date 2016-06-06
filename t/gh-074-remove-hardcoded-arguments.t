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

fixtures_ok [
    Donation => [
        [qw/id user_id create_date/],
        [ 1, 1, $now->clone->add( days => -30 )->ymd ],
        [ 2, 1, $now->clone->add( days => -30 )->ymd ],
        [ 3, 1, $now->clone->add( days => -30 )->ymd ],
        [ 4, 1, $now->clone->add( days => 8 )->ymd ],
    ],
    Order => [
        [qw/id user_id rental_date return_date/],
        [ 14975, 22621, '2015-10-22 11:23:00', '2015-10-20 12:03:29' ]
        , # 대여일보다 반납일이 이른경우
        [ 14976, 22622, '2015-10-27 09:45:00', '2015-10-29 12:03:29' ]
        , # 정상적인 경우(2일후 반납)
        [ 14977, 22623, '2015-10-27 15:12:00', '2015-10-27 19:00:00' ]
        , # 정상적인 경우(당일 반납)

        [ 14978, 22622, '2015-10-27 09:45:00', '2015-10-29 12:03:29' ]
        , # 정상적인 경우(2일후 반납)
    ],
    OrderDetail => [
        [qw/id name order_id clothes_code/],
        [ 86524, '자켓', 14975, '0J0H1' ],
        [ 86525, '자켓', 14976, '0J0H2' ],
        [ 86526, '자켓', 14977, '0J0H3' ],
        [ 86527, '자켓', 14978, '0J0H4' ],
    ],
    Clothes => [
        [qw/id code donation_id category/],
        [ 6343, '0J0H1', 1, 'jacket' ],
        [ 6344, '0J0H2', 2, 'jacket' ],
        [ 6345, '0J0H3', 3, 'jacket' ],
        [ 6346, '0J0H4', 4, 'jacket' ],
    ],
    ],
    'Installed fixtures';

my $system_start_date = {
    year      => 2014,
    month     => 12,
    day       => 17,
    time_zone => 'Asia/Seoul',
};

## Your testing code below ##

subtest "clothes.rent_ratio(): normal donation, earlier return than rent(abnormal)",
    sub {
    my $code       = "0J0H1";
    my $rent_ratio = 0;
    my $tz         = "Asia/Seoul";
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    my $ratio = $clothes->rent_ratio( $system_start_date, $tz );

    is $ratio, $rent_ratio => "clothes.rent_ratio";
    };

subtest "clothes.rent_ratio(): normal donation, two days after return", sub {
    my $code              = "0J0H2";
    my $tz                = "Asia/Seoul";
    my $rentable_duration = 30;
    my $rented_duration   = 3;
    my $rent_ratio        = 0.1;
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    is $clothes->rentable_duration( $system_start_date, $tz ),
        $rentable_duration => "clothes.rentable_duration";
    is $clothes->rented_duration, $rented_duration => "clothes.rented_duration";
    is $clothes->rent_ratio( $system_start_date, $tz ),
        $rent_ratio => "clothes.rent_ratio";
};

subtest "clothes.rent_ratio(): normal donation, immediately return", sub {
    my $code              = "0J0H3";
    my $tz                = "Asia/Seoul";
    my $rentable_duration = 30;
    my $rented_duration   = 1;
    my $rent_ratio        = 0.0333333333333333;
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    is $clothes->rentable_duration( $system_start_date, $tz ),
        $rentable_duration => "clothes.rentable_duration";
    is $clothes->rented_duration, $rented_duration => "clothes.rented_duration";
    is $clothes->rent_ratio( $system_start_date, $tz ),
        $rent_ratio => "clothes.rent_ratio";
};

subtest "clothes.rent_ratio(): abnormal donation, normal return", sub {
    my $code              = "0J0H4";
    my $tz                = "Asia/Seoul";
    my $rentable_duration = -8;
    my $rented_duration   = 3;
    my $rent_ratio        = -0.375;
    ok my $clothes = Clothes->find( { code => $code } ) => "find clothes";
    is $clothes->code, $code => "clothes.code";
    is $clothes->rentable_duration( $system_start_date, $tz ),
        $rentable_duration => "clothes.rentable_duration";
    is $clothes->rented_duration, $rented_duration => "clothes.rented_duration";
    is $clothes->rent_ratio( $system_start_date, $tz ),
        $rent_ratio => "clothes.rent_ratio";
};

## Your testing code above ##

done_testing;
