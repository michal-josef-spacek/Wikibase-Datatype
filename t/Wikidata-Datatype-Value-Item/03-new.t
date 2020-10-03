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
eval {
	Wikidata::Datatype::Value->new
};
is($EVAL_ERROR, "Parameter 'value' is required.\n",
	"Parameter 'value' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Value::Item->new(
		'value' => 'foo',
	);
};
is($EVAL_ERROR, "Parameter 'value' must begin with 'Q' and number after it.\n",
	"Bad 'value' parameter.");
clean();
