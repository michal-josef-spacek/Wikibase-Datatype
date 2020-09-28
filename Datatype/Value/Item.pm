package Wikidata::Datatype::Value::Item;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build is required);

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

sub type {
	return 'item';
}

sub BUILD {
	my $self = shift;

	if (defined $self->{'value'} && $self->{'value'} !~ m/^Q\d+$/ms) {
		err "Parameter 'value' must begin with 'Q' and number after it.";
	}

	return;
}

1;
