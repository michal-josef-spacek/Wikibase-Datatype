use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikibase::Datatype::Lexeme',
	{ 'also_private' => ['BUILD'] },
	'Wikibase::Datatype::Lexeme is covered.');
