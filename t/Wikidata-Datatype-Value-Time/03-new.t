use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Time;

# Test.
my $obj = Wikidata::Datatype::Value::Time->new(
	'value' => '+2020-09-01T00:00:00Z',
);
isa_ok($obj, 'Wikidata::Datatype::Value::Time');

# Test.
eval {
	Wikidata::Datatype::Value::Time->new;
};
is($EVAL_ERROR, "Parameter 'value' is required.\n",
	"Parameter 'value' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Value::Time->new(
		'calendarmodel' => 'foo',
		'value' => '+2020-09-01T00:00:00Z',
	);
};
is($EVAL_ERROR, "Parameter 'calendarmodel' must begin with 'Q' and number after it.\n",
	"Parameter 'calendarmodel' must begin with 'Q' and number after it.");
clean();
