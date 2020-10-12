use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Utils qw(check_property);

# Test.
my $self = {
	'key' => 'foo',
};
eval {
	check_property($self, 'key');
};
is($EVAL_ERROR, "Parameter 'key' must begin with 'P' and number after it.\n",
	"Parameter 'key' must begin with 'P' and number after it.");
clean();

# Test.
$self = {
	'key' => 'P123',
};
my $ret = check_property($self, 'key');
is($ret, undef, 'Right object is present.');
