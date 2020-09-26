use strict;
use warnings;

use Wikidata::Datatype;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::VERSION, 0.01, 'Version.');
