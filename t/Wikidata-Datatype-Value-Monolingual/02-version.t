use strict;
use warnings;

use Wikidata::Datatype::Value::Monolingual;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Value::Monolingual::VERSION, 0.01, 'Version.');
