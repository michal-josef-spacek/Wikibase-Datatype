#!/usr/bin/env perl

use strict;
use warnings;

use Error::Pure;
use Wikibase::Datatype::Utils qw(check_array_object);
use Wikibase::Datatype::Value;

$Error::Pure::TYPE = 'Error';

my $self = {
        'key' => [
                Wikibase::Datatype::Value->new(
                        'value' => 'Text value',
                ),
        ],
};
check_array_object($self, 'key', 'Wikibase::Datatype::Snak', 'Snak');

# Print out.
print "ok\n";

# Output like:
# #Error [/../Wikibase/Datatype/Utils.pm:?] Snak isn't 'Wikibase::Datatype::Snak' object.