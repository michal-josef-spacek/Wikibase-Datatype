use strict;
use warnings;

use English;
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
like($EVAL_ERROR, qr{site required}, "Parameter 'site' is required.");

# Test.
eval {
	Wikidata::Datatype::Sitelink->new(
		'site' => 'enwiki',
	);
};
like($EVAL_ERROR, qr{title required}, "Parameter 'value' is required.");
