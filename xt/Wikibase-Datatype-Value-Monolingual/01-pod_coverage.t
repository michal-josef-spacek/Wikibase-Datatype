use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikibase::Datatype::Value::Monolingual',
	{ 'also_private' => ['BUILD'] },
	'Wikibase::Datatype::Value::Monolingual is covered.');
