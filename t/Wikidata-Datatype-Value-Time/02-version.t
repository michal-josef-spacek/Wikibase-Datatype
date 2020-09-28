use strict;
use warnings;

use Wikidata::Datatype::Value::Time;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Value::Time::VERSION, 0.01, 'Version.');
