#!/usr/bin/env perl

use strict;
use warnings;

use Wikidata::Datatype::Utils qw(check_number);

my $self = {
        'key' => '10',
};
check_number($self, 'key');

# Print out.
print "ok\n";

# Output:
# ok