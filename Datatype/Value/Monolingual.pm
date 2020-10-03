package Wikidata::Datatype::Value::Monolingual;

use strict;
use warnings;

use Mo qw(build default is);

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

has language => (
	is => 'rw',
	default => 'en',
);

sub BUILD {
	my $self = shift;

	$self->type('monolingualtext');
}

1;
