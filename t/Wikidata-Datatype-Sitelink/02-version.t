use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Sitelink;

# Test.
is($Wikidata::Datatype::Sitelink::VERSION, 0.01, 'Version.');
