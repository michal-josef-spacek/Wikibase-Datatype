use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikidata::Datatype::Reference',
	{ 'also_private' => ['BUILD'] },
	'Wikidata::Datatype::Reference is covered.');
