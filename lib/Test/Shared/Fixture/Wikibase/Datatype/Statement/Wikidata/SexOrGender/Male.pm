package Test::Shared::Fixture::Wikibase::Datatype::Statement::Wikidata::SexOrGender::Male;

use base qw(Wikibase::Datatype::Statement);
use strict;
use warnings;

use Test::Shared::Fixture::Wikibase::Datatype::Reference::Wikidata::Fixture1;
use Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::SexOrGender::Male;

our $VERSION = 0.01;

sub new {
	my $class = shift;

	my @params = (
		'snak' => Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::SexOrGender::Male->new,
		'references' => [
			Test::Shared::Fixture::Wikibase::Datatype::Reference::Wikidata::Fixture1->new,
		],
	);

	my $self = $class->SUPER::new(@params);

	return $self;
}
1;

__END__