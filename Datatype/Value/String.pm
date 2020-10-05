package Wikidata::Datatype::Value::String;

use strict;
use warnings;

use Mo;

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

sub type {
	return 'string';
}

1;
