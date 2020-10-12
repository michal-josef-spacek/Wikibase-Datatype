use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Globecoordinate;

# Test.
is($Wikidata::Datatype::Value::Globecoordinate::VERSION, 0.01, 'Version.');
