use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikidata::Datatype::Value::Time',
	{ 'also_private' => ['BUILD'] },
	'Wikidata::Datatype::Value::Time is covered.');
