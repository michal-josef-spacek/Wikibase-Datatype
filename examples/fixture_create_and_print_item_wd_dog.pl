#!/usr/bin/env perl

use strict;
use warnings;

use Test::Shared::Fixture::Wikibase::Datatype::Item::Wikidata::Dog;
use Unicode::UTF8 qw(encode_utf8);
use Wikibase::Datatype::Print::Item;

# Object.
my $obj = Test::Shared::Fixture::Wikibase::Datatype::Item::Wikidata::Dog->new;

# Print out.
print encode_utf8(scalar Wikibase::Datatype::Print::Item::print($obj));

# Output:
# TODO