use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Utils;

# Test.
is($Wikidata::Datatype::Utils::VERSION, 0.01, 'Version.');
