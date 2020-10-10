use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Quantity;

# Test.
my $obj = Wikidata::Datatype::Value::Quantity->new(
	'value' => '10',
);
my $ret = $obj->unit;
is($ret, undef, 'Get default unit().');

# Test.
$obj = Wikidata::Datatype::Value::Quantity->new(
	'unit' => 'Q190900',
	'value' => '10',
);
$ret = $obj->unit;
is($ret, 'Q190900', 'Get unit().');
