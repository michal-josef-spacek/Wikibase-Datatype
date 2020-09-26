use strict;
use warnings;

use English;
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Wikidata::Datatype::Rank;

# Test.
my $obj = Wikidata::Datatype::Rank->new(
	'value' => 'normal',
);
isa_ok($obj, 'Wikidata::Datatype::Rank');

# Test.
eval {
	Wikidata::Datatype::Rank->new;
};
like($EVAL_ERROR, qr{^value required}, "Parameter 'value' is required.");

# Test.
eval {
	Wikidata::Datatype::Rank->new(
		'value' => 'foo',
	);
};
is(
	$EVAL_ERROR,
	"Parameter 'value' has bad value. Possible values are normal, preferred, deprecated.\n",
	"Parameter 'value' is bad.",
);
