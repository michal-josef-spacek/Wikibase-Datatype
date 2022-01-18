package Test::Shared::Fixture::Wikibase::Datatype::Statement::Wikidata::Fixture1;

use base qw(Wikibase::Datatype::Statement);
use strict;
use warnings;

use Test::Shared::Fixture::Wikibase::Datatype::Reference::Wikidata::Fixture1;
use Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::InstanceOf::Human;
use Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::Of::Alien;

sub new {
	my $class = shift;

	my @params = (
		'snak' => Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::InstanceOf::Human->new,
		'property_snaks' => [
			Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::Of::Alien->new,
		],
		'references' => [
			Test::Shared::Fixture::Wikibase::Datatype::Reference::Wikidata::Fixture1->new,
		],
	);
	my $self = $class->SUPER::new(@params);

	return $self;
}

1;

__END__
