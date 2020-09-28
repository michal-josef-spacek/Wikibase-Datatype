use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Item;

# Test.
is($Wikidata::Datatype::Value::Item::VERSION, 0.01, 'Version.');
