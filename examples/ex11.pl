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
print "Value: $value\n";
print "Type: $type\n";

# Output:
# Value: Q123
# Type: item