use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Statement;

# Test.
is($Wikidata::Datatype::Statement::VERSION, 0.01, 'Version.');
