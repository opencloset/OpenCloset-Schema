use Test::More;

use strict;
use warnings;

use Test::DBIx::Class {
    schema_class => 'OpenCloset::Schema',
    connect_info => [ 'dbi:SQLite:dbname=:memory:', '', '' ],
    connect_opts  => { quote_char => q{`}, },
    fixture_class => '::Populate',
    },
    'Order';

## Your testing code below ##

ok my $order = Order->create( { status_id => 14, user_id => 2 } ), 'Order created';
ok $order->create_date, 'create_date is not null';
ok $order->update_date, 'update_date is not null';

## Your testing code above ##

done_testing;
