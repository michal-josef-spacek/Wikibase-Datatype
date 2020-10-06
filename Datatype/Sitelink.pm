package Wikidata::Datatype::Sitelink;

use strict;
use warnings;

use Mo qw(build default is);
use Wikidata::Datatype::Utils qw(check_required);

our $VERSION = 0.01;

has badges => (
	is => 'ro',
	default => [],
);

has site => (
	is => 'ro',
);

has title => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	check_required($self, 'site');
	check_required($self, 'title');

	return;
}

1;
