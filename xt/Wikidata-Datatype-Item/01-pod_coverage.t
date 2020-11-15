use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikidata::Datatype::Item',
	{ 'also_private' => ['BUILD'] },
	'Wikidata::Datatype::Item is covered.');
