use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Globecoordinate;

# Test.
my $obj = Wikidata::Datatype::Value::Globecoordinate->new(
	'value' => [49.6398383, 18.1484031],
);
my $ret = $obj->globe;
is($ret, 'Q2', 'Get default globe().');

# Test.
$obj = Wikidata::Datatype::Value::Globecoordinate->new(
	'globe' => 'Q111',
	'value' => [49.6398383, 18.1484031],
);
$ret = $obj->globe;
is($ret, 'Q111', 'Get explicit globe().');
