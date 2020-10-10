#!/usr/bin/env perl

use strict;
use warnings;

$Error::Pure::TYPE = 'Error';

use Wikidata::Datatype::Utils qw(check_number);

my $self = {
        'key' => 'foo',
};
check_number($self, 'key');

# Print out.
print "ok\n";

# Output like:
# #Error [/../Wikidata/Datatype/Utils.pm:?] Parameter 'key' must be a number.