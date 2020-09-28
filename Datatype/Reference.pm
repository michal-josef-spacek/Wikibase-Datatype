package Wikidata::Datatype::Reference;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build default is required);

our $VERSION = 0.01;

has snaks => (
	is => 'rw',
	required => 1,
);

sub BUILD {
	my $self = shift;

	if ($self->{'snaks'}) {
		if (ref $self->{'snaks'} ne 'ARRAY') {
			err "Parameter 'snaks' must be a array.";
		} else {
			foreach my $snak (@{$self->{'snaks'}}) {
				if (! $snak->isa('Wikidata::Datatype::Snak')) {
					err "Reference isn't 'Wikidata::Datatype::Snak' object.";
				}
			}
		}
	}

	return;
}

1;
