use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::MockObject;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Utils qw(check_isa);

# Test.
my $self = {
	'key' => 'foo',
};
eval {
	check_isa($self, 'key', 'Foo');
};
is($EVAL_ERROR, "Parameter 'key' must be a 'Foo' object.\n",
	"Parameter 'key' must be a 'Foo' object.");
clean();

# Test.
my $mock = Test::MockObject->new;
$mock->fake_module('Foo',
	'new' => sub { return $self, 'Foo'; },
);
my $foo = Foo->new;
$self = {
	'key' => $foo,
};
my $ret = check_isa($self, 'key', 'Foo');
is($ret, undef, 'Right object is present.');
