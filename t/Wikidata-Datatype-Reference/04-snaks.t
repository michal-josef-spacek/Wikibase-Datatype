use strict;
use warnings;

use Test::More 'tests' => 7;
use Test::NoWarnings;
use Wikidata::Datatype::Reference;
use Wikidata::Datatype::Snak;
use Wikidata::Datatype::Value::String;
use Wikidata::Datatype::Value::Time;

# Test.
my $obj = Wikidata::Datatype::Reference->new(
	'snaks' => [],
);
my $ret_ar = $obj->snaks;
is_deeply($ret_ar, [], 'Get default snaks.');

# Test.
$obj = Wikidata::Datatype::Reference->new(
	'snaks' => [
		Wikidata::Datatype::Snak->new(
			'datatype' => 'url',
			'datavalue' => Wikidata::Datatype::Value::String->new(
				'value' => 'https://skim.cz',
			),
			'property' => 'P854',
		),
		Wikidata::Datatype::Snak->new(
			'datatype' => 'time',
			'datavalue' => Wikidata::Datatype::Value::Time->new(
				'value' => '+2020-10-03T00:00:00Z',
			),
			'property' => 'P813',
		),
	],
);
$ret_ar = $obj->snaks;
is(@{$ret_ar}, 2, 'Number of snaks.');
is($ret_ar->[0]->datavalue->value, 'https://skim.cz', 'First snak value.');
is($ret_ar->[0]->property, 'P854', 'First snak property.');
is($ret_ar->[1]->datavalue->value, '+2020-10-03T00:00:00Z', 'Second snak value.');
is($ret_ar->[1]->property, 'P813', 'Second snak property.');
