package Wikidata::Datatype::Value;

use strict;
use warnings;

use Mo qw(is required);

our $VERSION = 0.01;

has value => (
	is => 'rw',
	required => 1,
);

1;
