package Wikidata::Datatype::Rank;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build is required);
use List::MoreUtils qw(none);
use Readonly;

Readonly::Array our @RANKS => qw(normal preferred deprecated);

our $VERSION = 0.01;

has value => (
	is => 'rw',
	required => 1,
);

sub BUILD {
	my $self = shift;

	if (defined $self->{'value'} && none { $_ eq $self->{'value'} } @RANKS) {
		err "Parameter 'value' has bad value. Possible values are ".(
			join ', ', @RANKS).'.';
	}

	return;
}

1;
