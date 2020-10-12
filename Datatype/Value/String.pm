package Wikidata::Datatype::Value::String;

use strict;
use warnings;

use Mo;

our $VERSION = 0.01;

extends 'Wikidata::Datatype::Value';

sub type {
	return 'string';
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikidata::Datatype::Value::String - Wikidata string value datatype.

=head1 SYNOPSIS

 use Wikidata::Datatype::Value::String;

 my $obj = Wikidata::Datatype::Value::String->new(%params);
 my $type = $obj->type;
 my $value = $obj->value;

=head1 DESCRIPTION

This datatype is string class for representation of common string. There are
upper datatypes as commonsMedia, external-id, geo-shape, math, musical-notation,
string, tabular-data and url, which uses this data type.

=head1 METHODS

=head2 C<new>

 my $obj = Wikidata::Datatype::Value::String->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<value>

Value of instance.
Parameter is required.

=back

=head2 C<type>

 my $type = $obj->type;

Get type. This is constant 'string'.

Returns string.

=head2 C<value>

 my $value = $obj->value;

Get value.

Returns string.

=head1 ERRORS

 new():
         From Wikidata::Datatype::Value::new():
                 Parameter 'value' is required.

=head1 EXAMPLE

 use strict;
 use warnings;

 use Wikidata::Datatype::Value::String;

 # Object.
 my $obj = Wikidata::Datatype::Value::String->new(
         'value' => 'foo',
 );

 # Get type.
 my $type = $obj->type;

 # Get value.
 my $value = $obj->value;

 # Print out.
 print "Type: $type\n";
 print "Value: $value\n";

 # Output:
 # Type: string
 # Value: foo

=head1 DEPENDENCIES

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
