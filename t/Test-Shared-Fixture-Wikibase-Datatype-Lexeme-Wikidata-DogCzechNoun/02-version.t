use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::Lexeme::Wikidata::DogCzechNoun;

# Test.
is($Test::Shared::Fixture::Wikibase::Datatype::Lexeme::Wikidata::DogCzechNoun::VERSION, undef, 'Version.');
