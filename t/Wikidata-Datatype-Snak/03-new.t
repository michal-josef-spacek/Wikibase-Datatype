use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 9;
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
isa_ok($obj, 'Wikidata::Datatype::Snak');

# Test.
eval {
	Wikidata::Datatype::Snak->new(
		'datatype' => 'string',
		'property' => 'P123',
	);
};
is($EVAL_ERROR, "Parameter 'datavalue' is required.\n",
	"Parameter 'datavalue' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Snak->new(
		'datavalue' => Wikidata::Datatype::Value::String->new(
			'value' => 'foo',
		),
		'property' => 'P123',
	);
};
is($EVAL_ERROR, "Parameter 'datatype' is required.\n",
	"Parameter 'datatype' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Snak->new(
		'datavalue' => Wikidata::Datatype::Value::String->new(
			'value' => 'foo',
		),
		'datatype' => 'string',
	);
};
is($EVAL_ERROR, "Parameter 'property' is required.\n",
	"Parameter 'property' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Snak->new(
		'datavalue' => 'bad',
		'datatype' => 'string',
		'property' => 'P123',
	);
};
is($EVAL_ERROR, "Parameter 'datavalue' must be 'Wikidata::Datatype::Value' type.\n",
	"Parameter 'datavalue' is bad string.");
clean();

# Test.
eval {
	Wikidata::Datatype::Snak->new(
		'datavalue' => Wikidata::Datatype::Value::String->new(
			'value' => 'foo',
		),
		'datatype' => 'bad',
		'property' => 'P123',
	);
};
is($EVAL_ERROR, "Parameter 'datatype' = 'bad' isn't supported.\n",
	"Parameter 'datatype' is bad string.");
clean();

# Test.
eval {
	Wikidata::Datatype::Snak->new(
		'datavalue' => Wikidata::Datatype::Value::String->new(
			'value' => 'foo',
		),
		'datatype' => 'string',
		'property' => 'P123',
		'snaktype' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'snaktype' = 'bad' isn't supported.\n",
	"Parameter 'snaktype' is bad string.");
clean();

# Test.
eval {
	Wikidata::Datatype::Snak->new(
		'datavalue' => Wikidata::Datatype::Value::String->new(
			'value' => 'foo',
		),
		'datatype' => 'string',
		'property' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'property' has bad value.\n",
	"Parameter 'property' has bad value.");
clean();