package Wikidata::Datatype::Statement;

use strict;
use warnings;

use Error::Pure qw(err);
use List::MoreUtils qw(none);
use Mo qw(build default is);
use Readonly;
use Wikidata::Datatype::Utils qw(check_array_object);

Readonly::Array our @RANKS => qw(normal preferred deprecated);

our $VERSION = 0.01;

has entity => (
	is => 'ro',
);

has property_snaks => (
	default => [],
	is => 'ro',
);

has rank => (
	is => 'ro',
	default => 'normal',
);

has references => (
	default => [],
	is => 'ro',
);

has snak => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check requirements.
	if (! $self->{'entity'}) {
		err "Parameter 'entity' is required.";
	}
	if (! $self->{'snak'}) {
		err "Parameter 'snak' is required.";
	}

	# Check rank.
	if (defined $self->{'rank'} && none { $_ eq $self->{'rank'} } @RANKS) {
		err "Parameter 'rank' has bad value. Possible values are ".(
			join ', ', @RANKS).'.';
	}

	# Check snak.
	if (! $self->{'snak'}->isa('Wikidata::Datatype::Snak')) {
		err "Parameter 'snak' must be a 'Wikidata::Datatype::Snak' object.";
	}

	# Check property snaks.
	check_array_object($self, 'property_snaks', 'Wikidata::Datatype::Snak',
		'Property snak');

	# Check references.
	check_array_object($self, 'references', 'Wikidata::Datatype::Reference', 'Reference');

	return;
}

1;
