#!/usr/bin/env perl

use strict;
use warnings;

use Error::Pure;
use Wikidata::Datatype::Utils qw(check_entity);

$Error::Pure::TYPE = 'Error';

my $self = {
        'key' => 'bad_entity',
};
check_entity($self, 'key');

# Print out.
print "ok\n";

# Output like:
# #Error [/../Wikidata/Datatype/Utils.pm:36] Parameter 'key' must begin with 'Q' and number after it.