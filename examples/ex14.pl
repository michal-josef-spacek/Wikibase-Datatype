#!/usr/bin/env perl

use strict;
use warnings;

use Wikidata::Datatype::Value::Time;

# Object.
my $obj = Wikidata::Datatype::Value::Time->new(
        'precision' => 10,
        'value' => '+2020-09-01T00:00:00Z',
);

# Get precision.
my $precision = $obj->precision;

# Get type.
my $type = $obj->type;

# Get value.
my $value = $obj->value;

# Print out.
print "Precision: $precision\n";
print "Type: $type\n";
print "Value: $value\n";

# Output:
# Precision: 10
# Type: time
# Value: +2020-09-01T00:00:00Z