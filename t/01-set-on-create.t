use Test::More;

use strict;
use warnings;
use DateTime;

use Test::DBIx::Class {
    schema_class => 'OpenCloset::Schema',
    connect_info => [ 'dbi:SQLite:dbname=:memory:', '', '' ],
    connect_opts  => { quote_char => q{`}, },
    fixture_class => '::Populate',
    },
    'Order';

## Your testing code below ##

my $tz = 'Asia/Seoul';
my $now = DateTime->now( time_zone => $tz );

ok my $order = Order->create( { status_id => 14, user_id => 2 } ), 'Order created';
ok $order->create_date, 'create_date is not null';
ok $order->update_date, 'update_date is not null';
is( $order->create_date->time_zone->name, $tz,         'timezone' );
is( $order->update_date->time_zone->name, $tz,         'timezone' );
is( $order->create_date->epoch,           $now->epoch, 'epoch' );

## Your testing code above ##

done_testing;
