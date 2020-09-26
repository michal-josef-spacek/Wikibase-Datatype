use strict;
use warnings;

use Wikidata::Datatype::Snak;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Snak::VERSION, 0.01, 'Version.');
