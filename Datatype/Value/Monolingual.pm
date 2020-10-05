package Wikidata::Datatype::Value::Monolingual;

use strict;
use warnings;

use Mo qw(default is);

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

has language => (
	is => 'ro',
	default => 'en',
);

sub type {
	return 'monolingualtext';
}

1;
