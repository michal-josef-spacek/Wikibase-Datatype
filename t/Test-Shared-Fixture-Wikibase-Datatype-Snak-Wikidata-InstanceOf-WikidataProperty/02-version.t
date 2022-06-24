use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::InstanceOf::WikidataProperty;

# Test.
is($Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::InstanceOf::WikidataProperty::VERSION, 0.15, 'Version.');
