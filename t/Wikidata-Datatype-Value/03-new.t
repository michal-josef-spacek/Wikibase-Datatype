use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value;

# Test.
my $obj = Wikidata::Datatype::Value->new(
	'value' => 'foo',
	'type' => 'string',
);
isa_ok($obj, 'Wikidata::Datatype::Value');

# Test.
eval {
	Wikidata::Datatype::Value->new(
		'type' => 'string',
	);
};
is($EVAL_ERROR, "Parameter 'value' is required.\n",
	"Parameter 'value' is required.");
clean();
