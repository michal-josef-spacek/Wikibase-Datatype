#!/usr/bin/env perl

use strict;
use warnings;

use Wikidata::Datatype::Reference;
use Wikidata::Datatype::Snak;
use Wikidata::Datatype::Value::String;

# Object.
my $obj = Wikidata::Datatype::Reference->new(
        'snaks' => [
                Wikidata::Datatype::Snak->new(
                        'datatype' => 'string',
                        'datavalue' => Wikidata::Datatype::Value::String->new(
                                'value' => 'text',
                        ),
                        'property' => 'P11',
                ),
        ],
);

# Get value.
my @snaks = $obj->snaks;

# Print out number of snaks.
print "Number of snaks: ".@snaks."\n";

# Output:
# Number of snaks: 1