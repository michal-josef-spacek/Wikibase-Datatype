use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value;

# Test.
my $obj = Wikidata::Datatype::Value->new(
	'value' => 'foo',
);
my $ret = $obj->value;
is($ret, 'foo', 'Get value().');
