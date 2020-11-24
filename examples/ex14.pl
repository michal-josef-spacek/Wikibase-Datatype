#!/usr/bin/env perl

use strict;
use warnings;

use Wikibase::Datatype::Utils qw(check_required);

my $self = {
        'key' => 'value',
};
check_required($self, 'key');

# Print out.
print "ok\n";

# Output:
# ok