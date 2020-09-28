use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype;

# Test.
is($Wikidata::Datatype::VERSION, 0.01, 'Version.');
