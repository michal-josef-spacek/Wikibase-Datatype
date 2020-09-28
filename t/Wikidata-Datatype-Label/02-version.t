use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Label;

# Test.
is($Wikidata::Datatype::Label::VERSION, 0.01, 'Version.');
