use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);
use Wikidata::Datatype::Value::Monolingual;

# Test.
my $obj = Wikidata::Datatype::Value::Monolingual->new(
	'value' => 'Example',
);
my $ret = $obj->language;
is($ret, 'en', 'Get default language().');

# Test.
$obj = Wikidata::Datatype::Value::Monolingual->new(
	'language' => 'cs',
	'value' => decode_utf8('Příklad'),
);
$ret = $obj->language;
is($ret, 'cs', 'Get explicit language().');