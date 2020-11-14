package Wikidata::Datatype::Statement;

use strict;
use warnings;

use Error::Pure qw(err);
use List::MoreUtils qw(none);
use Mo qw(build default is);
use Readonly;
use Wikidata::Datatype::Utils qw(check_array_object check_isa check_required);

Readonly::Array our @RANKS => qw(normal preferred deprecated);

our $VERSION = 0.01;

has property_snaks => (
	default => [],
	is => 'ro',
);

has rank => (
	is => 'ro',
	default => 'normal',
);

has references => (
	default => [],
	is => 'ro',
);

has snak => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check requirements.
	check_required($self, 'snak');

	# Check rank.
	if (defined $self->{'rank'} && none { $_ eq $self->{'rank'} } @RANKS) {
		err "Parameter 'rank' has bad value. Possible values are ".(
			join ', ', @RANKS).'.';
	}

	# Check snak.
	check_isa($self, 'snak', 'Wikidata::Datatype::Snak');

	# Check property snaks.
	check_array_object($self, 'property_snaks', 'Wikidata::Datatype::Snak',
		'Property snak');

	# Check references.
	check_array_object($self, 'references', 'Wikidata::Datatype::Reference',
		'Reference');

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikidata::Datatype::Statement - Wikidata statement datatype.

=head1 SYNOPSIS

 use Wikidata::Datatype::Statement;

 my $obj = Wikidata::Datatype::Statement->new(%params);
 my $property_snaks_ar = $obj->property_snaks;
 my $rank = $obj->rank;
 my $referenes_ar = $obj->references;
 my $snak = $obj->snak;

=head1 DESCRIPTION

This datatype is statement class for representing claim.

=head1 METHODS

=head2 C<new>

 my $obj = Wikidata::Datatype::Statement->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<property_snaks>

Property snaks.
Parameter is reference to hash with Wikidata::Datatype::Snak instances.
Parameter is optional.
Default value is [].

=item * C<rank>

Rank value.
Parameter is string with these possible values: normal, preferred and deprecated
Default value is 'normal'.

=item * C<references>

List of references.
Parameter is reference to hash with Wikidata::Datatype::Reference instances.
Parameter is optional.
Default value is [].

=item * C<snak>

Main snak.
Parameter is Wikidata::Datatype::Snak instance.
Parameter is required.

=back

=head2 C<property_snaks>

 my $property_snaks_ar = $obj->property_snaks;

Get property snaks.

Returns reference to arrat with Wikidata::Datatype::Snak instances.

=head2 C<rank>

 my $rank = $obj->rank;

Get rank value.

=head2 C<references>

 my $referenes_ar = $obj->references;

Get references.

Returns reference to array with Wikidata::Datatype::Reference instance.

=head2 C<snak>

 my $snak = $obj->snak;

Get main snak.

Returns Wikidata::Datatype::Snak instance.

=head1 ERRORS

 new():
         From Wikidata::Datatype::Utils::check_required():
                 Parameter 'snak' is required.
         From Wikidata::Datatype::Utils::check_array_object():
                 Parameter 'property_snaks' must be a array.
                 Parameter 'references' must be a array.
                 Property snak isn't 'Wikidata::Datatype::Snak' object.
                 Reference isn't 'Wikidata::Datatype::Reference' object.
         From Wikidata::Datatype::Utils::check_isa():
                 Parameter 'snak' must be a 'Wikidata::Datatype::Snak' object.
         Parameter 'rank' has bad value. Possible values are normal, preferred, deprecated.

=head1 EXAMPLE

 use strict;
 use warnings;

 use Wikidata::Datatype::Reference;
 use Wikidata::Datatype::Statement;
 use Wikidata::Datatype::Snak;
 use Wikidata::Datatype::Value::Item;
 use Wikidata::Datatype::Value::String;
 use Wikidata::Datatype::Value::Time;


 # Object.
 my $obj = Wikidata::Datatype::Statement->new(

         # instance of (P31) human (Q5)
         'snak' => Wikidata::Datatype::Snak->new(
                  'datatype' => 'wikibase-item',
                  'datavalue' => Wikidata::Datatype::Value::Item->new(
                          'value' => 'Q5',
                  ),
                  'property' => 'P31',
         ),
         'property_snaks' => [
                 # of (P642) alien (Q474741)
                 Wikidata::Datatype::Snak->new(
                          'datatype' => 'wikibase-item',
                          'datavalue' => Wikidata::Datatype::Value::Item->new(
                                  'value' => 'Q474741',
                          ),
                          'property' => 'P642',
                 ),
         ],
         'references' => [
                  Wikidata::Datatype::Reference->new(
                          'snaks' => [
                                  # stated in (P248) Virtual International Authority File (Q53919)
                                  Wikidata::Datatype::Snak->new(
                                           'datatype' => 'wikibase-item',
                                           'datavalue' => Wikidata::Datatype::Value::Item->new(
                                                   'value' => 'Q53919',
                                           ),
                                           'property' => 'P248',
                                  ),

                                  # VIAF ID (P214) 113230702
                                  Wikidata::Datatype::Snak->new(
                                           'datatype' => 'external-id',
                                           'datavalue' => Wikidata::Datatype::Value::String->new(
                                                   'value' => '113230702',
                                           ),
                                           'property' => 'P214',
                                  ),

                                  # retrieved (P813) 7 December 2013
                                  Wikidata::Datatype::Snak->new(
                                           'datatype' => 'time',
                                           'datavalue' => Wikidata::Datatype::Value::Time->new(
                                                   'value' => '+2013-12-07T00:00:00Z',
                                           ),
                                           'property' => 'P813',
                                  ),
                          ],
                  ),
         ],
 );

 # Print out.
 print 'Claim: '.$obj->snak->property.' -> '.$obj->snak->datavalue->value."\n";
 print "Qualifiers:\n";
 foreach my $property_snak (@{$obj->property_snaks}) {
         print "\t".$property_snak->property.' -> '.
                 $property_snak->datavalue->value."\n";
 }
 print "References:\n";
 foreach my $reference (@{$obj->references}) {
         print "\tReference:\n";
         foreach my $reference_snak (@{$reference->snaks}) {
                 print "\t\t".$reference_snak->property.' -> '.
                         $reference_snak->datavalue->value."\n";
         }
 }
 print 'Rank: '.$obj->rank."\n";

 # Output:
 # Claim: P31 -> Q5
 # Qualifiers:
 #         P642 -> Q474741
 # References:
 #         Reference:
 #                 P248 -> Q53919
 #                 P214 -> 113230702
 #                 P813 -> +2013-12-07T00:00:00Z
 # Rank: normal

=head1 DEPENDENCIES

L<Error::Pure>,
L<List::MoreUtils>,
L<Mo>,
L<Readonly>,
L<Wikidata::Datatype::Utils>.

=head1 SEE ALSO

=over

=item L<Wikidata::Datatype>

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
