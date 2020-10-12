#!/usr/bin/env perl

use strict;
use warnings;

use Wikidata::Datatype::Value::Item;

# Object.
my $obj = Wikidata::Datatype::Value::Item->new(
        'value' => 'Q123',
);

# Get value.
my $value = $obj->value;

# Get type.
my $type = $obj->type;

# Print out.
print "Type: $type\n";
print "Value: $value\n";

# Output:
# Type: item
# Value: Q123