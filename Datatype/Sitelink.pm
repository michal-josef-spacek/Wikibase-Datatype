package Wikidata::Datatype::Sitelink;

use strict;
use warnings;

use Mo qw(default is required);

our $VERSION = 0.01;

has badges => (
	is => 'rw',
	default => [],
);

has site => (
	is => 'rw',
	required => 1,
);

has title => (
	is => 'rw',
	required => 1,
);

1;
