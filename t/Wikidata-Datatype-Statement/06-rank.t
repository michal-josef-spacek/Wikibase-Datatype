use strict;
use warnings;

use Test::More 'tests' => 2;
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
my $rank = $obj->rank;
is($rank, 'normal', 'Get default rank() value.');
