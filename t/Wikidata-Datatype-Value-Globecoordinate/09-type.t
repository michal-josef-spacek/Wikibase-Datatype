use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Globecoordinate;

# Test.
my $obj = Wikidata::Datatype::Value::Globecoordinate->new(
	'value' => [49.6398383, 18.1484031],
);
my $ret = $obj->type;
is($ret, 'globecoordinate', 'Get type().');
