#!/usr/bin/env perl

use strict;
use warnings;

use Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::SexOrGender::Male;
use Wikibase::Datatype::Print::Snak;

# Object.
my $obj = Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::SexOrGender::Male->new;

# Print out.
print scalar Wikibase::Datatype::Print::Snak::print($obj);

# Output:
# P21: Q6581097