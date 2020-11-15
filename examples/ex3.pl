#!/usr/bin/env perl

use strict;
use warnings;

use Wikibase::Datatype::Utils qw(check_array_object);
use Wikibase::Datatype::Value;

my $self = {
        'key' => [
                Wikibase::Datatype::Value->new(
                        'value' => 'Text value',
                ),
        ],
};
check_array_object($self, 'key', 'Wikibase::Datatype::Value', 'Value');

# Print out.
print "ok\n";

# Output:
# ok