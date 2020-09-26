use strict;
use warnings;

use Wikidata::Datatype::Rank;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Rank::VERSION, 0.01, 'Version.');
