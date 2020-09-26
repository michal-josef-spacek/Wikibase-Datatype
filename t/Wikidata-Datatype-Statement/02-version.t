use strict;
use warnings;

use Wikidata::Datatype::Statement;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Statement::VERSION, 0.01, 'Version.');
