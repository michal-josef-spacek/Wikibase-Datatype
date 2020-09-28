use strict;
use warnings;

use English;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Time;

# Test.
my $obj = Wikidata::Datatype::Value::Time->new(
	'value' => '+2020-09-01T00:00:00Z',
);
isa_ok($obj, 'Wikidata::Datatype::Value::Time');

# Test.
SKIP: {
	skip 'Fix inheritance.', 1;
eval {
	Wikidata::Datatype::Value::Item->new;
};
like($EVAL_ERROR, qr{value required}, "Parameter 'value' is required.");
};
