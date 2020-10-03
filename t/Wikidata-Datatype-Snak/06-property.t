use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Snak;
use Wikidata::Datatype::Value::String;

# Test.
my $obj = Wikidata::Datatype::Snak->new(
	'datavalue' => Wikidata::Datatype::Value::String->new(
		'value' => 'foo',
	),
	'datatype' => 'string',
	'property' => 'P123',
);
my $ret = $obj->property;
is($ret, 'P123', 'Get property() method.');
