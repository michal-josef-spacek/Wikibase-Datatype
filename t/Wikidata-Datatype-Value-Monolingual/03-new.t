use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);
use Wikidata::Datatype::Value::Monolingual;

# Test.
my $obj = Wikidata::Datatype::Value::Monolingual->new(
	'language' => 'cs',
	'value' => decode_utf8('Příklad'),
);
isa_ok($obj, 'Wikidata::Datatype::Value::Monolingual');

# Test.
SKIP: {
	skip 'Fix inheritance.', 1;
eval {
	Wikidata::Datatype::Value::Monolingual->new;
};
like($EVAL_ERROR, qr{value required}, "Parameter 'value' is required.");
};

# Test.
$obj = Wikidata::Datatype::Value::Monolingual->new(
	'value' => 'foo',
);
isa_ok($obj, 'Wikidata::Datatype::Value::Monolingual');
