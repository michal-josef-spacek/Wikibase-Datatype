use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Item;

# Test.
my $obj = Wikidata::Datatype::Value::Item->new(
	'value' => 'Q123',
);
isa_ok($obj, 'Wikidata::Datatype::Value::Item');

# Test.
SKIP: {
	skip 'Fix inheritance.', 1;
eval {
	Wikidata::Datatype::Value::Item->new;
};
like($EVAL_ERROR, qr{value required}, "Parameter 'value' is required.");
};

# Test.
eval {
	Wikidata::Datatype::Value::Item->new(
		'value' => 'foo',
	);
};
is($EVAL_ERROR, "Parameter 'value' must begin with 'Q' and number after it.\n",
	"Bad 'value' parameter.");
clean();
