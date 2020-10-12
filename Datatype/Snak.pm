package Wikidata::Datatype::Snak;

use strict;
use warnings;

use Error::Pure qw(err);
use List::MoreUtils qw(none);
use Mo qw(build is);
use Readonly;
use Wikidata::Datatype::Utils qw(check_isa check_required);

# Pairs data type and datatype.
Readonly::Hash our %DATA_TYPES => (
	'commonsMedia' => 'Wikidata::Datatype::Value::String',
	'external-id' => 'Wikidata::Datatype::Value::String',
	'geo-shape' => 'Wikidata::Datatype::Value::String',
	'globe-coordinate' => 'Wikidata::Datatype::Value::Globecoordinate',
	'math' => 'Wikidata::Datatype::Value::String',
	'monolingualtext' => 'Wikidata::Datatype::Value::Monolingual',
	'musical-notation' => 'Wikidata::Datatype::Value::String',
	'quantity' => 'Wikidata::Datatype::Value::Quantity',
	'string' => 'Wikidata::Datatype::Value::String',
	'tabular-data' => 'Wikidata::Datatype::Value::String',
	'time' => 'Wikidata::Datatype::Value::Time',
	'url' => 'Wikidata::Datatype::Value::String',
	'wikibase-item' => 'Wikidata::Datatype::Value::Item',
	'wikibase-property' => 'Wikidata::Datatype::Value::Property',
);
Readonly::Array our @SNAK_TYPES => qw(
	novalue
	somevalue
	value
);

our $VERSION = 0.01;

has datavalue => (
	is => 'ro',
);

has datatype => (
	is => 'ro',
);

has property => (
	is => 'ro',
);

has snaktype => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check snak type.
	if (defined $self->{'snaktype'}) {
		if (none { $self->{'snaktype'} eq $_ } @SNAK_TYPES) {
			err "Parameter 'snaktype' = '$self->{'snaktype'}' isn't supported.";
		}
	} else {
		$self->{'snaktype'} = 'value';
	}

	# Requirements.
	if ($self->{'snaktype'} eq 'value') {
		check_required($self, 'datavalue');
	}
	check_required($self, 'datatype');
	check_required($self, 'property');


	# Check data type.
	if (none { $self->{'datatype'} eq $_ } keys %DATA_TYPES) {
		err "Parameter 'datatype' = '$self->{'datatype'}' isn't supported.";
	}

	# Check data value.
	if ($self->{'snaktype'} eq 'value') {
		check_isa($self, 'datavalue', $DATA_TYPES{$self->{'datatype'}});
	}

	if ($self->{'property'} !~ m/^P\d+$/ms) {
		err "Parameter 'property' has bad value.";
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikidata::Datatype::Snak - Wikidata snak datatype.

=head1 SYNOPSIS

 use Wikidata::Datatype::Snak;

 my $obj = Wikidata::Datatype::Snak->new(%params);
 my $datatype = $obj->datatype;
 my $datavalue = $obj->datavalue;
 my $property = $obj->property;
 my $snaktype = $obj->snaktype;

=head1 DESCRIPTION

This datatype is snak class for representing relation between property and value.

=head1 METHODS

=head2 C<new>

 my $obj = Wikidata::Datatype::Snak->new(%params);

Constructor.

Retruns instance of object.

=over 8

=item * C<type>

Type of data.
Parameter is required.

=item * C<datavalue>

Value of data.
Parameter is required.

=item * C<property>

Property name (like /^P\d+$/).
Parameter is required.

=item * C<snaktype>

Snak type.
Parameter is string with these possible values: novalue somevalue value
Parameter is optional.
Default value is 'value'.

=back

=head2 C<datatype>

 my $datatype = $obj->datatype;

Get data type.

Returns string.

=head2 C<datavalue>

 my $datavalue = $obj->datavalue;

Get data value.

Returns instance of Wikidata::Datatype::Value.

=head2 C<property>

 my $property = $obj->property;

Get property name.

Returns string.

=head2 C<snaktype>

 my $snaktype = $obj->snaktype;

Get snak type.

Returns string.

=head1 ERRORS

 new():
         From Wikidata::Datatype::Utils::check_required():
                 Parameter 'datatype' is required.
                 Parameter 'datavalue' is required.
                 Parameter 'property' is required.
         From Wikidata::Datatype::Utils::check_isa():
                 Parameter 'datavalue' must be a 'Wikidata::Datatype::Value::%s' object.
         Parameter 'datatype' = '%s' isn't supported.
         Parameter 'property' has bad value.
         Parameter 'snaktype' = '%s' isn't supported.

=head1 EXAMPLE

 use strict;
 use warnings;

 use Wikidata::Datatype::Snak;
 use Wikidata::Datatype::Value::Item;

 # Object.
 my $obj = Wikidata::Datatype::Snak->new(
         'datatype' => 'wikibase-item',
         'datavalue' => Wikidata::Datatype::Value::Item->new(
                 'value' => 'Q5',
         ),
         'property' => 'P31',
 );

 # Get value.
 my $datavalue = $obj->datavalue->value;

 # Get datatype.
 my $datatype = $obj->datatype;

 # Get property.
 my $property = $obj->property;

 # Print out.
 print "Property: $property\n";
 print "Type: $datatype\n";
 print "Value: $datavalue\n";

 # Output:
 # Property: P31
 # Type: wikibase-item
 # Value: Q5

=head1 DEPENDENCIES

L<Error::Pure>,
L<List::MoreUtils>,
L<Mo>,
L<Readonly>,
L<Wikidata::Datatype::Utils>.

=head1 SEE ALSO

=over

=item L<Wikidata::Datatype>

Wikidata datatypes

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Wikidata-Datatype>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2020

BSD 2-Clause License

=head1 VERSION

0.01

=cut
