package Wikidata::Datatype::Value::Time;

use strict;
use warnings;

use Mo qw(build default is);

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

has after => (
	is => 'rw',
	default => 0,
);

has before => (
	is => 'rw',
	default => 0,
);

has calendarmodel => (
	is => 'ro',
	default => 'http://www.wikidata.org/entity/Q1985727',
);

has precision => (
	is => 'rw',
	default => 11,
);

has timezone => (
	is => 'rw',
	default => 0,
);

sub BUILD {
	my $self = shift;

	$self->type('time');
}

1;
