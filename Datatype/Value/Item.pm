package Wikidata::Datatype::Value::Item;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build default is required);

our $VERSION = 0.01;

has value => (
	is => 'rw',
	required => 1,
);

has type => (
	default => 'item',
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	if ($self->{'value'} !~ m/^Q\d+$/ms) {
		err "Parameter 'value' must begin with 'Q' and number after it.";
	}

	return;
}

1;
