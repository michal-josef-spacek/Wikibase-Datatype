use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Value;

# Test.
is($Wikibase::Datatype::Value::VERSION, 0.01, 'Version.');