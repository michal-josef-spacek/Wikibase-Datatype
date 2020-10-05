#!/usr/bin/env perl

use strict;
use warnings;

use Error::Pure;
use Wikidata::Datatype::Utils qw(check_array_object);
use Wikidata::Datatype::Value;

$Error::Pure::TYPE = 'Error';

my $self = {
        'key' => [
                Wikidata::Datatype::Value->new(
                        'value' => 'Text value',
                ),
        ],
};
check_array_object($self, 'key', 'Wikidata::Datatype::Snak', 'Snak');

# Print out.
print "ok\n";

# Output:
# #Error [/../Wikidata/Datatype/Utils.pm:22] Snak isn't 'Wikidata::Datatype::Snak' object.