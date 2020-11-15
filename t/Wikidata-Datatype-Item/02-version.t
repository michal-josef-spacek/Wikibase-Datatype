use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Item;

# Test.
is($Wikidata::Datatype::Item::VERSION, 0.01, 'Version.');
