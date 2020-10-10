#!/usr/bin/env perl

use strict;
use warnings;

use Wikidata::Datatype::Snak;
use Wikidata::Datatype::Value::Item;

# Object.
my $obj = Wikidata::Datatype::Snak->new(
        'datatype' => 'wikibase-item',
        'datavalue' => Wikidata::Datatype::Value::Item->new(
                'value' => 'Q5',
        ),
        'property' => 'P31',
);

# Get value.
my $datavalue = $obj->datavalue->value;

# Get datatype.
my $datatype = $obj->datatype;

# Get property.
my $property = $obj->property;

# Print out.
print "Property: $property\n";
print "Type: $datatype\n";
print "Value: $datavalue\n";

# Output:
# Property: P31
# Type: wikibase-item
# Value: Q5