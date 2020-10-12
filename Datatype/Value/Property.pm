package Wikidata::Datatype::Value::Property;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build);
use Wikidata::Datatype::Utils qw(check_property);

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

sub type {
	return 'property';
}

sub BUILD {
	my $self = shift;

	check_property($self, 'value');

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikidata::Datatype::Value::Property - Wikidata property value datatype.

=head1 SYNOPSIS

 use Wikidata::Datatype::Value::Property;

 my $obj = Wikidata::Datatype::Value::Property->new(%params);
 my $type = $obj->type;
 my $value = $obj->value;

=head1 DESCRIPTION

This datatype is item class for representation of wikibase item (e.g. Q123).

=head1 METHODS

=head2 C<new>

 my $obj = Wikidata::Datatype::Value::Property->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<value>

Value of instance.
Parameter must be in form /^P\d+$/ (regexp).
Parameter is required.

=back

=head2 C<type>

 my $type = $obj->type;

Get type. This is constant 'property'.

Returns string.

=head2 C<value>

 my $value = $obj->value;

Get value.

Returns string.

=head1 ERRORS

 new():
         From Wikidata::Datatype::Value::new():
                 Parameter 'value' is required.
         Parameter 'value' must begin with 'P' and number after it.

=head1 EXAMPLE

 use strict;
 use warnings;

 use Wikidata::Datatype::Value::Property;

 # Object.
 my $obj = Wikidata::Datatype::Value::Property->new(
         'value' => 'P123',
 );

 # Get value.
 my $value = $obj->value;

 # Get type.
 my $type = $obj->type;

 # Print out.
 print "Type: $type\n";
 print "Value: $value\n";

 # Output:
 # Type: property
 # Value: P123

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
