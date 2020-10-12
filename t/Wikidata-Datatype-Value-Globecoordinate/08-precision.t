use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Globecoordinate;

# Test.
my $obj = Wikidata::Datatype::Value::Globecoordinate->new(
	'value' => [49.6398383, 18.1484031],
);
my $ret = $obj->precision;
is($ret, '1e-07', 'Get default precision().');

# Test.
$obj = Wikidata::Datatype::Value::Globecoordinate->new(
	'precision' => 1,
	'value' => [49.6398383, 18.1484031],
);
$ret = $obj->precision;
is($ret, 1, 'Get explicit precision().');
