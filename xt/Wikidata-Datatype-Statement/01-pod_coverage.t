use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikidata::Datatype::Statement',
	{ 'also_private' => ['BUILD'] },
	'Wikidata::Datatype::Statement is covered.');
