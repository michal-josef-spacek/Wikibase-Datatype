use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Value;

# Test.
my $obj = Wikibase::Datatype::Value->new(
	'value' => 'foo',
	'type' => 'string',
);
my $ret = $obj->value;
is($ret, 'foo', 'Get value().');
