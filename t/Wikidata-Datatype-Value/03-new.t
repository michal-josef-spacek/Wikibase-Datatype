use strict;
use warnings;

use English;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value;

# Test.
my $obj = Wikidata::Datatype::Value->new(
	'value' => 'foo',
);
isa_ok($obj, 'Wikidata::Datatype::Value');

# Test.
eval {
	Wikidata::Datatype::Value->new
};
like($EVAL_ERROR, qr{value required}, "Parameter 'value' is required.");
