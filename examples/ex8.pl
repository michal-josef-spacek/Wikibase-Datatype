#!/usr/bin/env perl

use strict;
use warnings;

$Error::Pure::TYPE = 'Error';

use Wikidata::Datatype::Utils qw(check_isa);
use Wikidata::Datatype::Value;

my $self = {
        'key' => 'foo',
};
check_isa($self, 'key', 'Wikidata::Datatype::Value');

# Print out.
print "ok\n";

# Output like:
# #Error [/../Wikidata/Datatype/Utils.pm:?] Parameter 'key' must be a 'Wikidata::Datatype::Value' object.