use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Snak;

# Test.
is($Wikidata::Datatype::Snak::VERSION, 0.01, 'Version.');
