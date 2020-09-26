use strict;
use warnings;

use Wikidata::Datatype::Utils;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Utils::VERSION, 0.01, 'Version.');
