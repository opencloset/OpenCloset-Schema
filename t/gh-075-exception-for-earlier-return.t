use Test::More;

use strict;
use warnings;

use Test::DBIx::Class {
    schema_class => 'OpenCloset::Schema',
    connect_info => [ 'dbi:SQLite:dbname=:memory:', '', '' ],
    connect_opts  => { quote_char => q{`}, },
    fixture_class => '::Populate',
    },
    'Order', 'OrderDetail', 'Clothes';

fixtures_ok [
    Order => [
        [qw/id user_id rental_date return_date/],
        [ 14975, 22621, '2015-10-22 00:00:00', '2015-10-20 12:03:29' ]
        , # 대여일보다 반납일이 이른경우
        [ 14976, 22622, '2015-10-27 00:00:00', '2015-10-29 12:03:29' ]
        , # 정상적인 경우(2일후 반납)
    ],
    OrderDetail => [
        [qw/id name order_id clothes_code/],
        [ 86524, '자켓', 14975, '0J0H3' ],
        [ 86525, '자켓', 14976, '0J0H4' ],
    ],
    Clothes => [
        [qw/id code category/],
        [ 6343, '0J0H3', 'jacket' ],
        [ 6344, '0J0H4', 'jacket' ],
    ],
    ],
    'Installed fixtures';

## Your testing code below ##

subtest "return_date is earlier than rental_date", sub {
    ok my $order = Order->find( { id => 14975 } ) => "order: 14975";
    ok my $order_detail =
        $order->order_details->search( { clothes_code => "0J0H3" } )->first =>
        "order_detail";
    is $order_detail->id, 86524 => "order_detail.id";
    ok my $clothes = $order_detail->clothes => "clothes";
    is $clothes->code, "0J0H3" => "clothes.code";
    is $clothes->rented_duration,
        0 => "RENT: 2015-10-22 / RETURN: 2015-10-20 / rented duration: 0";
};

subtest "return_date is later than rental_date (normal case)", sub {
    ok my $order = Order->find( { id => 14976 } ) => "order: 14976";
    ok my $order_detail =
        $order->order_details->search( { clothes_code => "0J0H4" } )->first =>
        "order_detail";
    is $order_detail->id, 86525 => "order_detail.id";
    ok my $clothes = $order_detail->clothes => "clothes";
    is $clothes->code, "0J0H4" => "clothes.code";
    is $clothes->rented_duration,
        2 => "RENT: 2015-10-27 / RETURN: 2015-10-29 / rented duration: 2";
};

## Your testing code above ##

done_testing;
