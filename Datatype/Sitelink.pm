package Wikidata::Datatype::Sitelink;

use strict;
use warnings;

use Mo qw(build default is);
use Wikidata::Datatype::Utils qw(check_required);

our $VERSION = 0.01;

has badges => (
	is => 'rw',
	default => [],
);

has site => (
	is => 'rw',
);

has title => (
	is => 'rw',
);

sub BUILD {
	my $self = shift;

	check_required($self, 'site');
	check_required($self, 'title');
}

1;
