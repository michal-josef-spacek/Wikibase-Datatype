package Wikidata::Datatype::Snak;

use strict;
use warnings;

use Error::Pure qw(err);
use List::MoreUtils qw(none);
use Mo qw(build default is);
use Readonly;
use Wikidata::Datatype::Utils qw(check_required);

# Pairs data type and datatype.
Readonly::Hash our %DATA_TYPES => (
	'commonsMedia' => 'string',
	'external-id' => 'string',
	'monolingualtext' => 'monolingualtext',
	'string' => 'string',
	'time' => 'time',
	'url' => 'string',
	'wikibase-item' => 'wikibase-entityid',
);
Readonly::Array our @SNAK_TYPES => qw(
	novalue
	somevalue
	value
);

our $VERSION = 0.01;

has datavalue => (
	is => 'ro',
);

has datatype => (
	is => 'ro',
);

has property => (
	is => 'ro',
);

has snaktype => (
	is => 'ro',
	default => 'value',
);

sub BUILD {
	my $self = shift;

	# Requirements.
	check_required($self, 'datavalue');
	check_required($self, 'datatype');
	check_required($self, 'property');

	# Check data value.
	if (! $self->{'datavalue'}->isa('Wikidata::Datatype::Value')) {
		err "Parameter 'datavalue' must be 'Wikidata::Datatype::Value' type.";
	}

	# Check data type.
	if (none { $self->{'datatype'} eq $_ } keys %DATA_TYPES) {
		err "Parameter 'datatype' = '$self->{'datatype'}' isn't supported.";
	}

	# Check snak type.
	if (defined $self->{'snaktype'} && none { $self->{'snaktype'} eq $_ } @SNAK_TYPES) {
		err "Parameter 'snaktype' = '$self->{'snaktype'}' isn't supported.";
	}

	if ($self->{'property'} !~ m/^P\d+$/ms) {
		err "Parameter 'property' has bad value.";
	}

	return;
}

1;
