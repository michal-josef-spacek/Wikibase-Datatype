use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Sitelink;

# Test.
my $obj = Wikidata::Datatype::Sitelink->new(
	'site' => 'enwiki',
	'title' => 'Title',
);
my $ret = $obj->site;
is_deeply($ret, 'enwiki', 'Get site() method.');
