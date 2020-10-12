use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikidata::Datatype::Value::Globecoordinate',
	{ 'also_private' => ['BUILD'] },
	'Wikidata::Datatype::Value::Globecoordinate is covered.');
