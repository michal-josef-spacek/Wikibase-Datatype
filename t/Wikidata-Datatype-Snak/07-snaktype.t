use strict;
use warnings;

use Test::More 'tests' => 3;
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
my $ret = $obj->snaktype;
is($ret, 'value', 'Get default snaktype() value.');

# Test.
$obj = Wikidata::Datatype::Snak->new(
	'datavalue' => Wikidata::Datatype::Value::String->new(
		'value' => 'foo',
	),
	'datatype' => 'string',
	'property' => 'P123',
	'snaktype' => 'novalue',
);
$ret = $obj->snaktype;
is($ret, 'novalue', 'Get explicit snaktype() value.');
