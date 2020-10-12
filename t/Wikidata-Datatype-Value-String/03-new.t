use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::String;

# Test.
my $obj = Wikidata::Datatype::Value::String->new(
	'value' => 'text',
);
isa_ok($obj, 'Wikidata::Datatype::Value::String');

# Test.
eval {
	Wikidata::Datatype::Value::String->new
};
is($EVAL_ERROR, "Parameter 'value' is required.\n",
	"Parameter 'value' is required.");
clean();
