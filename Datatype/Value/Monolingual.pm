package Wikidata::Datatype::Value::Monolingual;

use strict;
use warnings;

use Mo qw(is required);

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

has language => (
	is => 'rw',
	required => 1,
);

sub type {
	return 'monolingualtext';
}

1;
