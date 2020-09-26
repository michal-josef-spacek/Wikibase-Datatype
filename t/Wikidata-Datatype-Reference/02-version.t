use strict;
use warnings;

use Wikidata::Datatype::Reference;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Wikidata::Datatype::Reference::VERSION, 0.01, 'Version.');
