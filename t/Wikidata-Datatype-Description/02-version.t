use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Description;

# Test.
is($Wikidata::Datatype::Description::VERSION, 0.01, 'Version.');
