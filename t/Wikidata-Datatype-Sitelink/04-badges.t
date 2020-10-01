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
my $ret_ar = $obj->badges;
is_deeply($ret_ar, [], 'Get default badges() method.');
