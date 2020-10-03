package Wikidata::Datatype::Reference;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build is);
use Wikidata::Datatype::Utils qw(check_array_object check_required);

our $VERSION = 0.01;

has snaks => (
	is => 'rw',
);

sub BUILD {
	my $self = shift;

	check_required($self, 'snaks');

	check_array_object($self, 'snaks', 'Wikidata::Datatype::Snak', 'Snak');

	return;
}

1;
