#!/usr/bin/env perl

use strict;
use warnings;

use Error::Pure;
use Wikidata::Datatype::Utils qw(check_property);

$Error::Pure::TYPE = 'Error';

my $self = {
        'key' => 'bad_property',
};
check_property($self, 'key');

# Print out.
print "ok\n";

# Output like:
# #Error [/../Wikidata/Datatype/Utils.pm:?] Parameter 'key' must begin with 'P' and number after it.