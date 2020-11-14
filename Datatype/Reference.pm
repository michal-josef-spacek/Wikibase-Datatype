package Wikidata::Datatype::Reference;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build is);
use Wikidata::Datatype::Utils qw(check_array_object check_required);

our $VERSION = 0.01;

has snaks => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	check_required($self, 'snaks');

	check_array_object($self, 'snaks', 'Wikidata::Datatype::Snak', 'Snak');

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikidata::Datatype::Reference - Wikidata reference datatype.

=head1 SYNOPSIS

 use Wikidata::Datatype::Reference;

 my $obj = Wikidata::Datatype::Reference->new(%params);
 my $snaks_ar = $obj->snaks;

=head1 DESCRIPTION

This datatype is reference class for all references in claim.

=head1 METHODS

=head2 C<new>

 my $obj = Wikidata::Datatype::Reference->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<snaks>

Reference to array with Wikidata::Datatype::Snak instances.
Parameter is required.

=back

=head2 C<snaks>

 my $snaks_ar = $obj->snaks;

Get snaks.

Returns reference to array of Wikidata::Datatype::Snak instances.

=head1 ERRORS

 new():
         From Wikidata::Datatype::Utils::check_required():
                 Parameter 'snaks' is required.
         From Wikidata::Datatype::Utils::check_array_object():
                 Parameter 'snaks' must be a array.
                 Snak isn't 'Wikidata::Datatype::Snak' object.

=head1 EXAMPLE

 use strict;
 use warnings;

 use Wikidata::Datatype::Reference;
 use Wikidata::Datatype::Snak;
 use Wikidata::Datatype::Value::String;

 # Object.
 my $obj = Wikidata::Datatype::Reference->new(
         'snaks' => [
                 Wikidata::Datatype::Snak->new(
                         'datatype' => 'string',
                         'datavalue' => Wikidata::Datatype::Value::String->new(
                                 'value' => 'text',
                         ),
                         'property' => 'P11',
                 ),
         ],
 );

 # Get value.
 my $snaks_ar = $obj->snaks;

 # Print out number of snaks.
 print "Number of snaks: ".@{$snaks_ar}."\n";

 # Output:
 # Number of snaks: 1

=head1 DEPENDENCIES

L<Error::Pure>,
L<Mo>,
L<Wikidata::Datatype::Utils>.

=head1 SEE ALSO

=over

=item L<Wikidata::Datatype>

Wikidata datatypes.

=item L<Wikidata::Datatype::Snak>

Wikidata snak datatype.

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
