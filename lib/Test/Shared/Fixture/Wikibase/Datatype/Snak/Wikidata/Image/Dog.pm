package Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::Image::Dog;

use base qw(Wikibase::Datatype::Snak);
use strict;
use warnings;

use Wikibase::Datatype::Value::String;

our $VERSION = 0.01;

sub new {
	my $class = shift;

	my @params = (
		'datatype' => 'commonsMedia',
		'datavalue' => Wikibase::Datatype::Value::String->new(
			'value' => 'Canadian Inuit Dog.jpg',
		),
		'property' => 'P18',
	);

	my $self = $class->SUPER::new(@params);

	return $self;
}
1;

__END__
