package Wikidata::Datatype::Reference;

use strict;
use warnings;

use Error::Pure qw(err);
use Error::Pure::Always;
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

	return;
}

1;
