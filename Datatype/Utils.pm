package Wikidata::Datatype::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_references);

our $VERSION = 0.01;

sub check_references {
	my $self = shift;

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
