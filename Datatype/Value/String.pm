package Wikidata::Datatype::Value::String;

use strict;
use warnings;

use Mo qw(build);

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

sub BUILD {
	my $self = shift;

	$self->type('string');
}

1;
