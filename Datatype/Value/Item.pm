package Wikidata::Datatype::Value::Item;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build);

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

sub type {
	return 'item';
}

sub BUILD {
	my $self = shift;

	if ($self->{'value'} !~ m/^Q\d+$/ms) {
		err "Parameter 'value' must begin with 'Q' and number after it.";
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikidata::Datatype::Value::Item - Wikidata item value datatype.

=head1 SYNOPSIS

 use Wikidata::Datatype::Value::Item;

 my $obj = Wikidata::Datatype::Value::Item->new(%params);
 my $type = $obj->type;
 my $value = $obj->value;

=head1 DESCRIPTION

This datatype is item class for representation of wikibase item (e.g. Q123).

=head1 METHODS

=head2 C<new>

 my $obj = Wikidata::Datatype::Value::Item->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<value>

Value of instance.
Parameter must be in form /^Q\d+$/ (regexp).
Parameter is required.

=back

=head2 C<type>

 my $type = $obj->type;

Get type. This is constant 'item'.

Returns string.

=head2 C<value>

 my $value = $obj->value;

Get value.

Returns string.

=head1 ERRORS

 new():
         From Wikidata::Datatype::Value::new():
                 Parameter 'value' is required.
         Parameter 'value' must begin with 'Q' and number after it.

=head1 EXAMPLE

 use strict;
 use warnings;

 use Wikidata::Datatype::Value::Item;

 # Object.
 my $obj = Wikidata::Datatype::Value::Item->new(
         'value' => 'Q123',
 );

 # Get value.
 my $value = $obj->value;

 # Get type.
 my $type = $obj->type;

 # Print out.
 print "Type: $type\n";
 print "Value: $value\n";

 # Output:
 # Type: item
 # Value: Q123

=head1 DEPENDENCIES

L<Error::Pure>,
L<Mo>,
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
