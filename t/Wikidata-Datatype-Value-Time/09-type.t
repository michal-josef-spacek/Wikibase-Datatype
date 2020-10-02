use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Time;

# Test.
my $obj = Wikidata::Datatype::Value::Time->new(
	'value' => '+2020-10-01T00:00:00Z',
);
my $ret = $obj->type;
is($ret, 'time', 'Get type().');
