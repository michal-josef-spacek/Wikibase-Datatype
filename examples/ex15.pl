#!/usr/bin/env perl

use strict;
use warnings;

use Wikidata::Datatype::Value;

# Object.
my $obj = Wikidata::Datatype::Value->new(
        'value' => 'foo',
        'type' => 'string',
);

# Get value.
my $value = $obj->value;

# Get type.
my $type = $obj->type;

# Print out.
print "Value: $value\n";
print "Type: $type\n";

# Output:
# Value: foo
# Type: string