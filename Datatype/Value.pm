package Wikidata::Datatype::Value;

use strict;
use warnings;

use Mo qw(build is);
use Wikidata::Datatype::Utils qw(check_required);

our $VERSION = 0.01;

has value => (
	is => 'rw',
);

has type => (
	'is' => 'rw',
);

sub BUILD {
	my $self = shift;

	check_required($self, 'value');
}

1;
