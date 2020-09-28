use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Time;

# Test.
is($Wikidata::Datatype::Value::Time::VERSION, 0.01, 'Version.');
