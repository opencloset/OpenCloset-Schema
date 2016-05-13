use Test::More;

use strict;
use warnings;

use Test::DBIx::Class {
    schema_class => 'OpenCloset::Schema',
    connect_info => [ 'dbi:SQLite:dbname=:memory:', '', '' ],
    connect_opts  => { quote_char => q{`}, },
    fixture_class => '::Populate',
    },
    'Clothes';

## Your testing code below ##

ok my $clothes =
    Clothes->create( { code => '0P001', category => 'pants', cuff => 7.00 } ),
    'Clothes created';

ok $clothes->update( { cuff => 7.25 } ), 'update clothes';
is $clothes->cuff, 7.25, 'by accessor';
is $clothes->get_column('cuff'), 18.41, 'by get_column';

my %columns  = $clothes->get_columns;
my %inflated = $clothes->get_inflated_columns;

is $columns{cuff},  18.41, 'by get_columns';
is $inflated{cuff}, 7.25,  'by get_inflated_columns';

## Your testing code above ##

done_testing;
