package Wikidata::Datatype::Value::String;

use strict;
use warnings;

use Error::Pure::Always;
use Mo qw(build default is required);

our $VERSION = 0.01;

has value => (
	is => 'rw',
	required => 1,
);

has type => (
	default => 'string',
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	check_references($self);

	return;
}

1;
