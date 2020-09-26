use strict;
use warnings;

use Wikidata::Datatype::Value;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Value::VERSION, 0.01, 'Version.');
