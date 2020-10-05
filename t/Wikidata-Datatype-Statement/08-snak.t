use strict;
use warnings;

use Test::More 'tests' => 4;
use Test::NoWarnings;
use Wikidata::Datatype::Snak;
use Wikidata::Datatype::Statement;
use Wikidata::Datatype::Value::String;

# Test.
my $obj = Wikidata::Datatype::Statement->new(
	'entity' => 'Q42',
	'snak' => Wikidata::Datatype::Snak->new(
		'datavalue' => Wikidata::Datatype::Value::String->new(
			'value' => 'foo',
		),
		'datatype' => 'string',
		'property' => 'P123',
	),
);
my $ret = $obj->snak;
is($ret->datavalue->value, 'foo', 'Get snak value.');
is($ret->datatype, 'string', 'Get snak type.');
is($ret->property, 'P123', 'Get snak property.');
