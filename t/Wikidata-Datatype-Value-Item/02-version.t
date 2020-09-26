use strict;
use warnings;

use Wikidata::Datatype::Value::Item;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Value::Item::VERSION, 0.01, 'Version.');
