#!/usr/bin/env perl

use strict;
use warnings;

use Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::InstanceOf::WikidataProperty;
use Wikibase::Datatype::Print::Snak;

# Object.
my $obj = Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::InstanceOf::WikidataProperty->new;

# Print out.
print scalar Wikibase::Datatype::Print::Snak::print($obj);

# Output:
# P31: Q32753077