use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::StatedIn::VIAF;

# Test.
is($Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::StatedIn::VIAF::VERSION, 0.38, 'Version.');
