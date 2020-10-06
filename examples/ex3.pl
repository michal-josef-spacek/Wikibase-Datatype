#!/usr/bin/env perl

use strict;
use warnings;

use Wikidata::Datatype::Utils qw(check_array_object);
use Wikidata::Datatype::Value;

my $self = {
        'key' => [
                Wikidata::Datatype::Value->new(
                        'value' => 'Text value',
                ),
        ],
};
check_array_object($self, 'key', 'Wikidata::Datatype::Value', 'Value');

# Print out.
print "ok\n";

# Output:
# ok