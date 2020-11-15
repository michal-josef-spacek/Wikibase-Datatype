#!/usr/bin/env perl

use strict;
use warnings;

$Error::Pure::TYPE = 'Error';

use Wikibase::Datatype::Utils qw(check_isa);
use Wikibase::Datatype::Value;

my $self = {
        'key' => 'foo',
};
check_isa($self, 'key', 'Wikibase::Datatype::Value');

# Print out.
print "ok\n";

# Output like:
# #Error [/../Wikibase/Datatype/Utils.pm:?] Parameter 'key' must be a 'Wikibase::Datatype::Value' object.