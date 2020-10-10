package Wikidata::Datatype::Value::Quantity;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build is);
use Wikidata::Datatype::Utils qw(check_number);

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

has lower_bound => (
	is => 'ro',
);

has unit => (
	is => 'ro',
);

has upper_bound => (
	is => 'ro',
);

sub type {
	return 'quantity';
}

sub BUILD {
	my $self = shift;

	if (defined $self->{'unit'} && $self->{'unit'} !~ m/^Q\d+$/ms) {
		err "Parameter 'unit' is bad. Possible value is /^Q\\d+\$/."
	}

	check_number($self, 'value');

	if (defined $self->{'lower_bound'}) {
		check_number($self, 'lower_bound');
		if ($self->{'lower_bound'} >= $self->{'value'}) {
			err "Parameter 'lower_bound' must be less than value.";
		}
	}
	if (defined $self->{'upper_bound'}) {
		check_number($self, 'upper_bound');
		if ($self->{'upper_bound'} <= $self->{'value'}) {
			err "Parameter 'upper_bound' must be greater than value.";
		}
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikidata::Datatype::Value::Quantity - Wikidata quantity value datatype.

=head1 SYNOPSIS

 use Wikidata::Datatype::Value::Quantity;

 my $obj = Wikidata::Datatype::Value::Quantity->new(%params);
 my $lower_bound = $obj->lower_bound;
 my $type = $obj->type;
 my $unit = $obj->unit;
 my $upper_bound = $obj->upper_bound;
 my $value = $obj->value;

=head1 DESCRIPTION

This datatype is quantity class for representation of quantity. Optionaly we can
define unit of quantity.

=head1 METHODS

=head2 C<new>

 my $obj = Wikidata::Datatype::Value::Quantity->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<lower_bound>

Lower bound of value.
Value must be a positive or negative number.
Parameter is optional.
Default value is 0.

=item * C<unit>

Unit of instance.
Parameter is optional.
Default value is undef - without unit.

=item * C<upper_bound>

Upper bound of value.
Value must be a positive or negative number.
Parameter is optional.
Default value is 0.

=item * C<value>

Value of instance.
Value must be a positive or negative number.
Parameter is required.

=back

=head2 C<lower_bound>

 my $lower_bound = $obj->lower_bound;

Get lower bound.

Returns number.

=head2 C<type>

 my $type = $obj->type;

Get type. This is constant 'string'.

Returns string.

=head2 C<unit>

 my $unit = $obj->unit;

Get unit. Unit could be 1 or url to entity.

Returns string.

=head2 C<upper_bound>

 my $upper_bound = $obj->upper_bound;

Get upper bound.

Returns number.

=head2 C<value>

 my $value = $obj->value;

Get value.

Returns string.

=head1 ERRORS

 new():
         From Wikidata::Datatype::Value::new():
                 Parameter 'value' is required.
         From Wikidata::Datatype::Utils::check_number():
                 Parameter 'lower_bound' must be a number.
                 Parameter 'upper_bound' must be a number.
                 Parameter 'value' must be a number.
         Parameter 'lower_bound' must be less than value.
         Parameter 'unit' is bad. Possible value is /^Q\d+$/.
         Parameter 'upper_bound' must be greater than value.

=head1 EXAMPLE1

 use strict;
 use warnings;

 use Wikidata::Datatype::Value::Quantity;

 # Object.
 my $obj = Wikidata::Datatype::Value::Quantity->new(
         'value' => '10',
 );

 # Get type.
 my $type = $obj->type;

 # Get unit.
 my $unit = $obj->unit;

 # Get value.
 my $value = $obj->value;

 # Print out.
 print "Type: $type\n";
 if (defined $unit) {
         print "Unit: $unit\n";
 }
 print "Value: $value\n";

 # Output:
 # Type: quantity
 # Value: 10

=head1 EXAMPLE2

 use strict;
 use warnings;

 use Wikidata::Datatype::Value::Quantity;

 # Object.
 my $obj = Wikidata::Datatype::Value::Quantity->new(
         'unit' => 'Q190900',
         'value' => '10',
 );

 # Get type.
 my $type = $obj->type;

 # Get unit.
 my $unit = $obj->unit;

 # Get value.
 my $value = $obj->value;

 # Print out.
 print "Type: $type\n";
 print "Unit: $unit\n";
 print "Value: $value\n";

 # Output:
 # Type: quantity
 # Unit: Q190900
 # Value: 10

=head1 DEPENDENCIES

L<Error::Pure>,
L<Mo>,
L<Wikidata::Datatype::Utils>,
L<Wikidata::Datatype::Value>.

=head1 SEE ALSO

=over

=item L<Wikidata::Datatype::Value>

Wikidata datatypes.

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
