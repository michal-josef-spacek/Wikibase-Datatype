use strict;
use warnings;

use English;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::String;

# Test.
my $obj = Wikidata::Datatype::Value::String->new(
	'value' => 'text',
);
isa_ok($obj, 'Wikidata::Datatype::Value::String');

# Test.
SKIP: {
	skip 'Fix inheritance.', 1;
eval {
	Wikidata::Datatype::Value::String->new;
};
like($EVAL_ERROR, qr{value required}, "Parameter 'value' is required.");
};
