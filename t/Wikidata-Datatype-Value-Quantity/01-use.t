use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Wikidata::Datatype::Value::Quantity');
}

# Test.
require_ok('Wikidata::Datatype::Value::Quantity');
