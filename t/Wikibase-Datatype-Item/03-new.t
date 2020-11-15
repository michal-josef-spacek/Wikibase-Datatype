use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Item;

# Test.
my $obj = Wikibase::Datatype::Item->new;
isa_ok($obj, 'Wikibase::Datatype::Item');
