#!/usr/bin/env perl

use strict;
use warnings;

use Error::Pure;
use Wikidata::Datatype::Utils qw(check_required);

$Error::Pure::TYPE = 'Error';

my $self = {
        'key' => undef,
};
check_required($self, 'key');

# Print out.
print "ok\n";

# Output:
# #Error [/../Wikidata/Datatype/Utils.pm:35] Parameter 'key' is required.