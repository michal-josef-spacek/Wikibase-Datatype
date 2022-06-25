use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Statement;

# Test.
is($Wikibase::Datatype::Statement::VERSION, 0.17, 'Version.');
