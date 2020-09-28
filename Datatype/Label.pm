package Wikidata::Datatype::Label;

use strict;
use warnings;

use Mo qw(is required);

our $VERSION = 0.01;

has language => (
	is => 'rw',
	required => 1,
);

has label => (
	is => 'rw',
	required => 1,
);

1;
