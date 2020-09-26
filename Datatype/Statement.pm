package Wikidata::Datatype::Statement;

use strict;
use warnings;

use Error::Pure qw(err);
use Error::Pure::Always;
use Mo qw(build default is required);
use Wikidata::Datatype::Utils qw(check_references);

our $VERSION = 0.01;

has entity => (
	is => 'ro',
	required => 1,
);

has references => (
	default => [],
	is => 'rw',
);

has property => (
	is => 'rw',
	required => 1,
);

has rank => (
	is => 'rw',
	default => 'normal',
);

has value => (
	is => 'rw',
	required => 1,
);

sub BUILD {
	my $self = shift;

	check_references($self);

	return;
}

1;
