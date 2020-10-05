use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikidata::Datatype::Sitelink',
	{ 'also_private' => ['BUILD'] },
	'Wikidata::Datatype::Sitelink is covered.');
