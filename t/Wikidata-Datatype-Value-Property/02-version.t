use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Property;

# Test.
is($Wikidata::Datatype::Value::Property::VERSION, 0.01, 'Version.');
