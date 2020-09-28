use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value;

# Test.
is($Wikidata::Datatype::Value::VERSION, 0.01, 'Version.');
