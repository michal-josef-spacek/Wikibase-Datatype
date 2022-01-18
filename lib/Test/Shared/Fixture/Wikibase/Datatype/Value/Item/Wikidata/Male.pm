package Test::Shared::Fixture::Wikibase::Datatype::Value::Item::Wikidata::Male;

use base qw(Wikibase::Datatype::Value::Item);
use strict;
use warnings;

our $VERSION = 0.01;

sub new {
	my $class = shift;

	my @params = (
		'value' => 'Q6581097',
	);

	my $self = $class->SUPER::new(@params);

	return $self;
}

1;

__END__
