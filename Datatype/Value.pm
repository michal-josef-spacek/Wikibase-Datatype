package Wikidata::Datatype::Value;

use strict;
use warnings;

use Mo qw(build is);
use Wikidata::Datatype::Utils qw(check_required);

our $VERSION = 0.01;

has value => (
	is => 'rw',
);

has type => (
	'is' => 'rw',
);

sub BUILD {
	my $self = shift;

	check_required($self, 'value');
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikidata::Datatype::Value - Wikidata value datatype.

=head1 SYNOPSIS

 use Wikidata::Datatype::Value;

 my $obj = Wikidata::Datatype::Value->new(%params);
 my $value = $obj->value;
 my $type = $obj->type;

=head1 DESCRIPTION

This datatype is base class for all Value datatypes.

=head1 METHODS

=head2 C<new>

 my $obj = Wikidata::Datatype::Value->new(%params);

Constructor.

Retruns instance of object.

=over 8

=item * C<value>

Value of instance.
Parameter is required.

=item * C<type>

Type of instance.
Default value is undef.

=back

=head2 C<value>

 my $value = $obj->value;

Get value.

Returns string.

=head2 C<type>

 my $type = $obj->type;

Get type.

Returns string.

=head1 ERRORS

 new():
         From Wikidata::Datatype::Utils::check_required():
                 Parameter 'value' is required.
                 Parameter 'type' is required.

=head1 EXAMPLE

 use strict;
 use warnings;

 use Wikidata::Datatype::Value;

 # Object.
 my $obj = Wikidata::Datatype::Value->new(
         'value' => 'foo',
         'type' => 'string',
 );

 # Get value.
 my $value = $obj->value;

 # Get type.
 my $type = $obj->type;

 # Print out.
 print "Value: $value\n";
 print "Type: $type\n";

 # Output:
 # Value: foo
 # Type: string

=head1 DEPENDENCIES

L<Mo>,
L<Wikidata::Datatype::Utils>.

=head1 SEE ALSO

=over

=item L<Wikidata::Datatype::Value::Item>

Wikidata item value datatype

=item L<Wikidata::Datatype::Value::Monolingual>

Wikidata monolingual value datatype

=item L<Wikidata::Datatype::Value::String>

Wikidata string value datatype

=item L<Wikidata::Datatype::Value::Time>

Wikidata time value datatype

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
