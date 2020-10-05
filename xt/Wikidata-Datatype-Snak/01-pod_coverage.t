use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikidata::Datatype::Snak',
	{ 'also_private' => ['BUILD'] },
	'Wikidata::Datatype::Snak is covered.');
