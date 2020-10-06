#!/usr/bin/env perl

use strict;
use warnings;

use Wikidata::Datatype::Utils qw(check_isa);
use Wikidata::Datatype::Value;

my $self = {
        'key' => Wikidata::Datatype::Value->new(
                'value' => 'foo',
        ),
};
check_isa($self, 'key', 'Wikidata::Datatype::Value');

# Print out.
print "ok\n";

# Output:
# ok