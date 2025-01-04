use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 5;
use Test::NoWarnings;
use Wikibase::Datatype::Utils qw(check_language);

# Test.
my $self = {
	'key' => 'foo',
};
eval {
	check_language($self, 'key');
};
is($EVAL_ERROR, "Language code 'foo' isn't code supported by Wikibase.\n",
	"Language code 'foo' isn't code supported by Wikibase.");
clean();

# Test.
$self = {
	'key' => 'xx',
};
eval {
	check_language($self, 'key');
};
is($EVAL_ERROR, "Language code 'xx' isn't code supported by Wikibase.\n",
	"Language code 'xx' isn't code supported by Wikibase.");
clean();

# Test.
$self = {
	'key' => 'en',
};
my $ret = check_language($self, 'key');
is($ret, undef, 'Right language is present.');

# Test.
$self = {
	'key' => 'xx',
};
$Wikibase::Datatype::Utils::SKIP_CHECK_LANG = 1;
$ret = check_language($self, 'key');
is($ret, undef, 'Not supported language is present without error.');
