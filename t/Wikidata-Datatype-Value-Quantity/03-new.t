use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 8;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Quantity;

# Test.
my $obj = Wikidata::Datatype::Value::Quantity->new(
	'value' => '10',
);
isa_ok($obj, 'Wikidata::Datatype::Value::Quantity');

# Test.
$obj = Wikidata::Datatype::Value::Quantity->new(
	'unit' => 'Q190900',
	'value' => '10',
);
isa_ok($obj, 'Wikidata::Datatype::Value::Quantity');

# Test.
eval {
	Wikidata::Datatype::Value::Quantity->new;
};
is($EVAL_ERROR, "Parameter 'value' is required.\n",
	"Parameter 'value' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Value::Quantity->new(
		'lower_bound' => 11,
		'value' => 10,
	);
};
is($EVAL_ERROR, "Parameter 'lower_bound' must be less than value.\n",
	"Parameter 'lower_bound' must be less than value.");
clean();

# Test.
eval {
	Wikidata::Datatype::Value::Quantity->new(
		'lower_bound' => 10,
		'value' => 10,
	);
};
is($EVAL_ERROR, "Parameter 'lower_bound' must be less than value.\n",
	"Parameter 'lower_bound' must be less than value. Same value.");
clean();

# Test.
eval {
	Wikidata::Datatype::Value::Quantity->new(
		'upper_bound' => 9,
		'value' => 10,
	);
};
is($EVAL_ERROR, "Parameter 'upper_bound' must be greater than value.\n",
	"Parameter 'upper_bound' must be greater than value.");
clean();

# Test.
eval {
	Wikidata::Datatype::Value::Quantity->new(
		'upper_bound' => 10,
		'value' => 10,
	);
};
is($EVAL_ERROR, "Parameter 'upper_bound' must be greater than value.\n",
	"Parameter 'upper_bound' must be greater than value. Same value.");
clean();