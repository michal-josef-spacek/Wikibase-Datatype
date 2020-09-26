use strict;
use warnings;

use Wikidata::Datatype::Value::String;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Value::String::VERSION, 0.01, 'Version.');
