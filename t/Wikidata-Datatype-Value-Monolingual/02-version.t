use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Monolingual;

# Test.
is($Wikidata::Datatype::Value::Monolingual::VERSION, 0.01, 'Version.');
