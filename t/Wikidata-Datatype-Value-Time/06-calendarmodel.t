use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Time;

# Test.
my $obj = Wikidata::Datatype::Value::Time->new(
	'value' => '+2020-10-01T00:00:00Z',
);
my $ret = $obj->calendarmodel;
is($ret, 'http://www.wikidata.org/entity/Q1985727',
	'Get default calendarmodel().');

# Test.
$obj = Wikidata::Datatype::Value::Time->new(
	'calendarmodel' => 'http://www.wikidata.org/entity/Q1985786',
	'value' => '+2020-10-01T00:00:00Z',
);
$ret = $obj->calendarmodel;
is($ret, 'http://www.wikidata.org/entity/Q1985786',
	'Get explicit calendarmodel().');
