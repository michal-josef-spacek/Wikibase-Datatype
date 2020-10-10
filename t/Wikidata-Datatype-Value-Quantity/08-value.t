use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Quantity;

# Test.
my $obj = Wikidata::Datatype::Value::Quantity->new(
	'value' => '10',
);
my $ret = $obj->value;
is($ret, '10', 'Get positive value().');

# Test.
$obj = Wikidata::Datatype::Value::Quantity->new(
	'value' => '-10',
);
$ret = $obj->value;
is($ret, '-10', 'Get negative value().');
