package Wikidata::Datatype::Statement;

use strict;
use warnings;

use Error::Pure qw(err);
use List::MoreUtils qw(none);
use Mo qw(build default is required);
use Readonly;

Readonly::Array our @RANKS => qw(normal preferred deprecated);

our $VERSION = 0.01;

has entity => (
	is => 'ro',
	required => 1,
);

has property_snak => (
	is => 'rw',
);

has references => (
	default => [],
	is => 'rw',
);

has snak => (
	is => 'rw',
	required => 1,
);

has rank => (
	is => 'rw',
	default => 'normal',
);

sub BUILD {
	my $self = shift;

	# Check rank.
	if (defined $self->{'rank'} && none { $_ eq $self->{'rank'} } @RANKS) {
		err "Parameter 'rank' has bad value. Possible values are ".(
			join ', ', @RANKS).'.';
	}

	# Check snak.
	if (! $self->{'snak'}->isa('Wikidata::Datatype::Snak')) {
		err "Parameter 'snak' must be a 'Wikidata::Datatype::Snak' object.";
	}

	# Check property snak.
	if ($self->{'property_snak'}) {
		if (ref $self->{'property_snak'} ne 'ARRAY') {
			err "Parameter 'property_snak' must be a array.";
		} else {
			foreach my $property_snak (@{$self->{'property_snak'}}) {
				if (! $property_snak->isa('Wikidata::Datatype::Snak')) {
					err "Reference isn't 'Wikidata::Datatype::Snak' object.";
				}
			}
		}
	}

	# Check references.
	if ($self->{'references'}) {
		if (ref $self->{'references'} ne 'ARRAY') {
			err "Parameter 'references' must be a array.";
		} else {
			foreach my $reference (@{$self->{'references'}}) {
				if (! $reference->isa('Wikidata::Datatype::Reference')) {
					err "Reference isn't 'Wikidata::Datatype::Reference' object.";
				}
			}
		}
	}

	return;
}

1;
