use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Wikidata::Datatype::Sitelink;

# Test.
my $obj = Wikidata::Datatype::Sitelink->new(
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
