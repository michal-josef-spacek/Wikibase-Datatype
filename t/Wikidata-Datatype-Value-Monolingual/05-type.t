use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Monolingual;

# Test.
my $obj = Wikidata::Datatype::Value::Monolingual->new(
	'value' => 'Example',
);
my $ret = $obj->type;
is($ret, 'monolingualtext', 'Get type().');
