#!/usr/bin/env perl

use strict;
use warnings;

use Error::Pure;
use Wikibase::Datatype::Utils qw(check_required);

$Error::Pure::TYPE = 'Error';

my $self = {
        'key' => undef,
};
check_required($self, 'key');

# Print out.
print "ok\n";

# Output like:
# #Error [/../Wikibase/Datatype/Utils.pm:?] Parameter 'key' is required.