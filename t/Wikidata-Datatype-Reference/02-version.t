use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Reference;

# Test.
is($Wikidata::Datatype::Reference::VERSION, 0.01, 'Version.');
