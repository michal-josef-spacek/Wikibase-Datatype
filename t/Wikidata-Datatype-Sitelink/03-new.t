use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 6;
use Test::NoWarnings;
use Wikidata::Datatype::Sitelink;
use Wikidata::Datatype::Value::Item;

# Test.
my $obj = Wikidata::Datatype::Sitelink->new(
	'badges' => [
		Wikidata::Datatype::Value::Item->new(
			'value' => 'Q123',
		),
	],
	'site' => 'enwiki',
	'title' => 'Title',
);
isa_ok($obj, 'Wikidata::Datatype::Sitelink');

# Test.
eval {
	Wikidata::Datatype::Sitelink->new(
		'title' => 'Title',
	);
};
is($EVAL_ERROR, "Parameter 'site' is required.\n",
	"Parameter 'site' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Sitelink->new(
		'site' => 'enwiki',
	);
};
is($EVAL_ERROR, "Parameter 'title' is required.\n",
	"Parameter 'title' is required.");
clean();

# Test.
eval {
	Wikidata::Datatype::Sitelink->new(
		'badges' => 'bad',
		'site' => 'enwiki',
		'title' => 'Main page',
	);
};
is($EVAL_ERROR, "Parameter 'badges' must be a array.\n",
	"Parameter 'badges' must be a array.");
clean();

# Test.
eval {
	Wikidata::Datatype::Sitelink->new(
		'badges' => ['bad'],
		'site' => 'enwiki',
		'title' => 'Main page',
	);
};
is($EVAL_ERROR, "Badge isn't 'Wikidata::Datatype::Value::Item' object.\n",
	"Badge isn't 'Wikidata::Datatype::Value::Item' object.");
clean();
