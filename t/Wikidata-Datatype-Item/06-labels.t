use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Item;

# Test.
my $obj = Wikidata::Datatype::Item->new;
my $ret_ar = $obj->labels;
is_deeply(
	$ret_ar,
	[],
	'Without labels.',
);
