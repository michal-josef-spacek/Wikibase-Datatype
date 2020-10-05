use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value;

# Test.
my $obj = Wikidata::Datatype::Value->new(
	'value' => 'foo',
	'type' => 'string',
);
my $ret = $obj->type;
is($ret, 'string', 'Get type().');
