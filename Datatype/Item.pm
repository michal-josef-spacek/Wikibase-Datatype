package Wikidata::Datatype::Item;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build default is);
use Wikidata::Datatype::Utils qw(check_array_object);

our $VERSION = 0.01;

has aliases => (
	default => [],
	is => 'ro',
);

has descriptions => (
	default => [],
	is => 'ro',
);

has labels => (
	default => [],
	is => 'ro',
);

has lastrevid => (
	is => 'ro',
);

has modified => (
	is => 'ro',
);

has ns => (
	default => 0,
	is => 'ro',
);

has sitelinks => (
	default => [],
	is => 'ro',
);

has statements => (
	default => [],
	is => 'ro',
);

has title => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check aliases.
	check_array_object($self, 'aliases', 'Wikidata::Datatype::Value::Monolingual',
		'Alias');

	# Check descriptions.
	check_array_object($self, 'descriptions', 'Wikidata::Datatype::Value::Monolingual',
		'Decsription');
	$self->_check_number_of_lang_items('descriptions', 'Description');

	# Check labels.
	check_array_object($self, 'labels', 'Wikidata::Datatype::Value::Monolingual',
		'Label');
	$self->_check_number_of_lang_items('labels', 'Label');

	# Check sitelinks.
	check_array_object($self, 'sitelinks', 'Wikidata::Datatype::Sitelink',
		'Sitelink');
	$self->_check_number_of_site_items;

	# Check statements.
	check_array_object($self, 'statements', 'Wikidata::Datatype::Statement',
		'Statement');

	return;
}

# TODO Nasledujici dve routines sjednotit do jedne. Po testech.
sub _check_number_of_lang_items {
	my ($self, $method, $object_name) = @_;

	my $lang_hr = {};
	foreach my $lang_item (@{$self->$method}) {
		$lang_hr->{$lang_item->language} += 1;
	}

	foreach my $lang (keys %{$lang_hr}) {
		if ($lang_hr->{$lang} > 1) {
			err "$object_name for language '$lang' has multiple values."
		}
	}

	return;
}

sub _check_number_of_site_items {
	my ($self, $object_name) = @_;

	my $site_hr = {};
	foreach my $site_item (@{$self->sitelinks}) {
		$site_hr->{$site_item->site} += 1;
	}

	foreach my $site (keys %{$site_hr}) {
		if ($site_hr->{$site} > 1) {
			err "Sitelink for site '$site' has multiple values.";
		}
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikidata::Datatype::Item - Wikidata page datatype.

=head1 SYNOPSIS

 use Wikidata::Datatype::Item;

 my $obj = Wikidata::Datatype::Item->new(%params);
 my $aliases_ar = $obj->aliases;
 my $descriptions_ar = $obj->descriptions;
 my $labels_ar = $obj->labels;
 my $lastrevid = $obj->lastrevid;
 my $modified = $obj->modified;
 my $ns = $obj->ns;
 my $sitelinks_ar = $obj->sitelinks;
 my $statements_ar = $obj->statements;
 my $title = $obj->title;

=head1 DESCRIPTION

This datatype is item class for representing claim.

=head1 METHODS

=head2 C<new>

 my $obj = Wikidata::Datatype::Item->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<aliases>

Item aliases. Multiple per language.
Reference to array with Wikidata::Datatype::Value::Monolingual instances.
Parameter is optional.

=item * C<descriptions>

Item descriptions. One per language.
Reference to array with Wikidata::Datatype::Value::Monolingual instances.
Parameter is optional.

=item * C<labels>

Item descriptions. One per language.
Reference to array with Wikidata::Datatype::Value::Monolingual instances.
Parameter is optional.

=item * C<lastrevid>

Last revision ID.
Parameter is optional.

=item * C<modified>

Date of modification.
Parameter is optional.

=item * C<ns>

Namespace.
Default value is 0.

=item * C<sitelinks>

Item sitelinks. One per site.
Reference to array with Wikidata::Datatype::Sitelink instances.
Parameter is optional.

=item * C<statements>

Item statements.
Reference to array with Wikidata::Datatype::Statement instances.
Parameter is optional.

=item * C<title>

Item title.
Parameter is optional.

=back

=head2 C<aliases>

 my $aliases_ar = $obj->aliases;

Get aliases.

Returns reference to array with Wikidata::Datatype::Value::Monolingual instances.

=head2 C<descriptions>

 my $descriptions_ar = $obj->descriptions;

Get descriptions.

Returns reference to array with Wikidata::Datatype::Value::Monolingual instances.

=head2 C<lastrevid>

 my $lastrevid = $obj->lastrevid;

Get last revision ID.

Returns string.

=head2 C<modified>

 my $modified = $obj->modified;

Get date of modification.

Returns string.

=head2 C<ns>

 my $ns = $obj->ns;

Get namespace.

Returns number.

=head2 C<sitelinks>

 my $sitelinks_ar = $obj->sitelinks;

Get sitelinks.

Returns reference to array with Wikidata::Datatype::Sitelink instances.

=head2 C<statements>

 my $statements_ar = $obj->statements;

Get statements.

Returns reference to arrat with Wikidata::Datatype::Statement instances.

=head2 C<title>

 my $title = $obj->title;

Get title.

Returns string.

=head1 ERRORS

 new():
         From Wikidata::Datatype::Utils::check_array_object():
                 Alias isn't 'Wikidata::Datatype::Value::Monolingual' object.
                 Description isn't 'Wikidata::Datatype::Value::Monolingual' object.
                 Label isn't 'Wikidata::Datatype::Value::Monolingual' object.
                 Parameter 'aliases' must be a array.
                 Parameter 'descriptions' must be a array.
                 Parameter 'labels' must be a array.
                 Parameter 'sitelinks' must be a array.
                 Parameter 'statements' must be a array.
                 Sitelink isn't 'Wikidata::Datatype::Sitelink' object.
                 Statement isn't 'Wikidata::Datatype::Statement' object.
         Sitelink for site '%s' has multiple values.
         Description for language '%s' has multiple values.
         Label for language '%s' has multiple values.

=head1 EXAMPLE

 use strict;
 use warnings;

 use Wikidata::Datatype::Item;
 use Wikidata::Datatype::Reference;
 use Wikidata::Datatype::Sitelink;
 use Wikidata::Datatype::Snak;
 use Wikidata::Datatype::Statement;
 use Wikidata::Datatype::Value::Item;
 use Wikidata::Datatype::Value::Monolingual;
 use Wikidata::Datatype::Value::String;
 use Wikidata::Datatype::Value::Time;

 # Object.
 my $statement1 = Wikidata::Datatype::Statement->new(
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
 my $statement2 = Wikidata::Datatype::Statement->new(
         # sex or gender (P21) male (Q6581097)
         'snak' => Wikidata::Datatype::Snak->new(
                  'datatype' => 'wikibase-item',
                  'datavalue' => Wikidata::Datatype::Value::Item->new(
                          'value' => 'Q6581097',
                  ),
                  'property' => 'P21',
         ),
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

 # Main item.
 my $obj = Wikidata::Datatype::Item->new(
         'aliases' => [
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'cs',
                         'value' => 'Douglas Noël Adams',
                 ),
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'cs',
                         'value' => 'Douglas Noel Adams',
                 ),
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'cs',
                         'value' => 'Douglas N. Adams',
                 ),
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'en',
                         'value' => 'Douglas Noel Adams',
                 ),
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'en',
                         'value' => 'Douglas Noël Adams',
                 ),
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'en',
                         'value' => 'Douglas N. Adams',
                 ),
         ],
         'descriptions' => [
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'cs',
                         'value' => 'anglický spisovatel, humorista a dramatik',
                 ),
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'en',
                         'value' => 'English writer and humorist',
                 ),
         ],
         'labels' => [
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'cs',
                         'value' => 'Douglas Adams',
                 ),
                 Wikidata::Datatype::Value::Monolingual->new(
                         'language' => 'en',
                         'value' => 'Douglas Adams',
                 ),
         ],
         'sitelinks' => [
                 Wikidata::Datatype::Sitelink->new(
                         'site' => 'cswiki',
                         'title' => 'Douglas Adams',
                 ),
                 Wikidata::Datatype::Sitelink->new(
                         'site' => 'enwiki',
                         'title' => 'Douglas Adams',
                 ),
         ],
         'statements' => [
                 $statement1,
                 $statement2,
         ],
         'title' => 'Q42',
 );

 # Print out.
 print "Title: ".$obj->title."\n";
 print "Labels:\n";
 foreach my $label (sort { $a->language cmp $b->language } @{$obj->labels}) {
         print "\t".$label->value.' ('.$label->language.")\n";
 }
 print "Descriptions:\n";
 foreach my $desc (sort { $a->language cmp $b->language } @{$obj->descriptions}) {
         print "\t".$desc->value.' ('.$desc->language.")\n";
 }
 print "Aliases:\n";
 foreach my $alias (sort { $a->language cmp $b->language } @{$obj->aliases}) {
         print "\t".$alias->value.' ('.$alias->language.")\n";
 }
 print "Sitelinks:\n";
 foreach my $sitelink (@{$obj->sitelinks}) {
         print "\t".$sitelink->title.' ('.$sitelink->site.")\n";
 }
 print "Statements:\n";
 foreach my $statement (@{$obj->statements}) {
         print "\tStatement:\n";
         print "\t\t".$statement->snak->property.' -> '.$statement->snak->datavalue->value."\n";
         print "\t\tQualifers:\n";
         foreach my $property_snak (@{$statement->property_snaks}) {
                 print "\t\t\t".$property_snak->property.' -> '.
                         $property_snak->datavalue->value."\n";
         }
         print "\t\tReferences:\n";
         foreach my $reference (@{$statement->references}) {
                 print "\t\t\tReference:\n";
                 foreach my $reference_snak (@{$reference->snaks}) {
                         print "\t\t\t".$reference_snak->property.' -> '.
                                 $reference_snak->datavalue->value."\n";
                 }
         }
 }

 # Output:
 # Title: Q42
 # Labels:
 #         Douglas Adams (cs)
 #         Douglas Adams (en)
 # Descriptions:
 #         anglický spisovatel, humorista a dramatik (cs)
 #         English writer and humorist (en)
 # Aliases:
 #         Douglas Noël Adams (cs)
 #         Douglas Noel Adams (cs)
 #         Douglas N. Adams (cs)
 #         Douglas Noel Adams (en)
 #         Douglas Noël Adams (en)
 #         Douglas N. Adams (en)
 # Sitelinks:
 #         Douglas Adams (cswiki)
 #         Douglas Adams (enwiki)
 # Statements:
 #         Statement:
 #                 P31 -> Q5
 #                 Qualifers:
 #                         P642 -> Q474741
 #                 References:
 #                         Reference:
 #                         P248 -> Q53919
 #                         P214 -> 113230702
 #                         P813 -> +2013-12-07T00:00:00Z
 #         Statement:
 #                 P21 -> Q6581097
 #                 Qualifers:
 #                 References:
 #                         Reference:
 #                         P248 -> Q53919
 #                         P214 -> 113230702
 #                         P813 -> +2013-12-07T00:00:00Z

=head1 DEPENDENCIES

L<Error::Pure>,
L<Mo>,
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