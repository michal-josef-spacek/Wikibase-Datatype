package Wikidata::Datatype::Reference;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build is required);
use Wikidata::Datatype::Utils qw(check_array_object);

our $VERSION = 0.01;

has snaks => (
	is => 'rw',
	required => 1,
);

sub BUILD {
	my $self = shift;

	check_array_object($self, 'snaks', 'Wikidata::Datatype::Snak', 'Snak');

	return;
}

1;
