use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Wikidata::Datatype::Reference;

# Test.
my $obj = Wikidata::Datatype::Reference->new(
	'snaks' => [],
);
isa_ok($obj, 'Wikidata::Datatype::Reference');

# Test.
eval {
	Wikidata::Datatype::Reference->new(
		'snaks' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'snaks' must be a array.\n",
	"Parameter 'snaks' must be a array.");
clean();

# Test.
eval {
	Wikidata::Datatype::Reference->new(
		'snaks' => ['bad'],
	);
};
is($EVAL_ERROR, "Snak isn't 'Wikidata::Datatype::Snak' object.\n",
	"Snak isn't 'Wikidata::Datatype::Snak' object.");
clean();
