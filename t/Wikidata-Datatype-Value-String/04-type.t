use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value::String;

# Test.
my $obj = Wikidata::Datatype::Value::String->new(
	'value' => 'string',
);
my $ret = $obj->type;
is($ret, 'string', 'Get type().');
