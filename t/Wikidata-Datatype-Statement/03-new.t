use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 11;
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
isa_ok($obj, 'Wikidata::Datatype::Statement');

# Test.
eval {
	Wikidata::Datatype::Statement->new(
		'snak' => Wikidata::Datatype::Snak->new(
			'datavalue' => Wikidata::Datatype::Value::String->new(
				'value' => 'foo',
			),
			'datatype' => 'string',
			'property' => 'P123',
		),
	);
};
is($EVAL_ERROR, "Parameter 'entity' is required.\n",
	"Parameter 'entity' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Statement->new(
		'entity' => 'Q42',
	);
};
is($EVAL_ERROR, "Parameter 'snak' is required.\n",
	"Parameter 'snak' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Statement->new(
		'entity' => 'Q42',
		'snak' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'snak' must be a 'Wikidata::Datatype::Snak' object.\n",
	"Parameter 'snak' must be a 'Wikidata::Datatype::Snak' object.");
clean();

# Test.
eval {
	Wikidata::Datatype::Statement->new(
		'entity' => 'Q42',
		'rank' => 'bad',
		'snak' => Wikidata::Datatype::Snak->new(
			'datavalue' => Wikidata::Datatype::Value::String->new(
				'value' => 'foo',
			),
			'datatype' => 'string',
			'property' => 'P123',
		),
	);
};
is($EVAL_ERROR,
	"Parameter 'rank' has bad value. Possible values are normal, preferred, deprecated.\n",
	"Parameter 'rank' has bad value.");
clean();

# Test.
$obj = Wikidata::Datatype::Statement->new(
	'entity' => 'Q42',
	'rank' => 'preferred',
	'snak' => Wikidata::Datatype::Snak->new(
		'datavalue' => Wikidata::Datatype::Value::String->new(
			'value' => 'foo',
		),
		'datatype' => 'string',
		'property' => 'P123',
	),
);
isa_ok($obj, 'Wikidata::Datatype::Statement');

# Test.
eval {
	Wikidata::Datatype::Statement->new(
		'entity' => 'Q42',
		'property_snaks' => 'bad',
		'snak' => Wikidata::Datatype::Snak->new(
			'datavalue' => Wikidata::Datatype::Value::String->new(
				'value' => 'foo',
			),
			'datatype' => 'string',
			'property' => 'P123',
		),
	);
};
is($EVAL_ERROR, "Parameter 'property_snaks' must be a array.\n",
	"Parameter 'property_snaks' must be a array.");
clean();

# Test.
eval {
	Wikidata::Datatype::Statement->new(
		'entity' => 'Q42',
		'property_snaks' => ['bad'],
		'snak' => Wikidata::Datatype::Snak->new(
			'datavalue' => Wikidata::Datatype::Value::String->new(
				'value' => 'foo',
			),
			'datatype' => 'string',
			'property' => 'P123',
		),
	);
};
is($EVAL_ERROR, "Property snak isn't 'Wikidata::Datatype::Snak' object.\n",
	"Property snak isn't 'Wikidata::Datatype::Snak' object.");
clean();

# Test.
eval {
	Wikidata::Datatype::Statement->new(
		'entity' => 'Q42',
		'references' => 'bad',
		'snak' => Wikidata::Datatype::Snak->new(
			'datavalue' => Wikidata::Datatype::Value::String->new(
				'value' => 'foo',
			),
			'datatype' => 'string',
			'property' => 'P123',
		),
	);
};
is($EVAL_ERROR, "Parameter 'references' must be a array.\n",
	"Parameter 'references' must be a array.");
clean();

# Test.
eval {
	Wikidata::Datatype::Statement->new(
		'entity' => 'Q42',
		'references' => ['bad'],
		'snak' => Wikidata::Datatype::Snak->new(
			'datavalue' => Wikidata::Datatype::Value::String->new(
				'value' => 'foo',
			),
			'datatype' => 'string',
			'property' => 'P123',
		),
	);
};
is($EVAL_ERROR, "Reference isn't 'Wikidata::Datatype::Reference' object.\n",
	"Reference isn't 'Wikidata::Datatype::Reference' object.");
clean();
