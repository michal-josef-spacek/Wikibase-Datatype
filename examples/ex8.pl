#!/usr/bin/env perl

use strict;
use warnings;

use Wikibase::Datatype::Utils qw(check_isa);
use Wikibase::Datatype::Value;

my $self = {
        'key' => Wikibase::Datatype::Value->new(
                'value' => 'foo',
        ),
};
check_isa($self, 'key', 'Wikibase::Datatype::Value');

# Print out.
print "ok\n";

# Output:
# ok