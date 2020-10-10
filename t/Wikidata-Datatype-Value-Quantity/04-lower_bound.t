use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Quantity;

# Test.
my $obj = Wikidata::Datatype::Value::Quantity->new(
	'value' => '10',
);
my $ret = $obj->lower_bound;
is($ret, undef, 'Get default lower_bound().');

# Test.
$obj = Wikidata::Datatype::Value::Quantity->new(
	'lower_bound' => 9,
	'value' => '10',
);
$ret = $obj->lower_bound;
is($ret, 9, 'Get explicit lower_bound().');
