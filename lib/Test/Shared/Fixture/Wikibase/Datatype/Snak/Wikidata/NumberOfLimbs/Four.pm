package Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::NumberOfLimbs::Four;

use base qw(Wikibase::Datatype::Snak);
use strict;
use warnings;

use Wikibase::Datatype::Value::Quantity;

our $VERSION = 0.36;

sub new {
	my $class = shift;

	my @params = (
		'datatype' => 'quantity',
		'datavalue' => Wikibase::Datatype::Value::Quantity->new(
			'value' => 4,
		),
		'property' => 'P123456789',
	);

	my $self = $class->SUPER::new(@params);

	return $self;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::NumberOfLimbs::Four - Test instance for Wikidata snak.

=head1 SYNOPSIS

 use Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::NumberOfLimbs::Four;

 my $obj = Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::NumberOfLimbs::Four->new;
 my $datatype = $obj->datatype;
 my $datavalue = $obj->datavalue;
 my $property = $obj->property;
 my $snaktype = $obj->snaktype;

=head1 METHODS

=head2 C<new>

 my $obj = Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::NumberOfLimbs::Four->new;

Constructor.

Returns instance of object.

=head2 C<datatype>

 my $datatype = $obj->datatype;

Get data type.

Returns string.

=head2 C<datavalue>

 my $datavalue = $obj->datavalue;

Get data value.

Returns instance of Wikibase::Datatype::Value.

=head2 C<property>

 my $property = $obj->property;

Get property name.

Returns string.

=head2 C<snaktype>

 my $snaktype = $obj->snaktype;

Get snak type.

Returns string.

=head1 EXAMPLE

=for comment filename=fixture_create_and_print_snak_wd_number_of_limbs_four.pl

 use strict;
 use warnings;

 use Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::NumberOfLimbs::Four;
 use Wikibase::Datatype::Print::Snak;

 # Object.
 my $obj = Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::NumberOfLimbs::Four->new;

 # Print out.
 print scalar Wikibase::Datatype::Print::Snak::print($obj);

 # Output:
 # P123456789: 4

=head1 DEPENDENCIES

L<Wikibase::Datatype::Snak>,
L<Wikibase::Datatype::Value::Quantity>.

=head1 SEE ALSO

=over

=item L<Wikibase::Datatype>

Wikibase datatypes.

=item L<Wikibase::Datatype::Snak>

Wikibase snak datatype.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Wikibase-Datatype>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2020-2025

BSD 2-Clause License

=head1 VERSION

0.36

=cut
