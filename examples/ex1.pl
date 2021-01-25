#!/usr/bin/env perl

use strict;
use warnings;

use Unicode::UTF8 qw(decode_utf8 encode_utf8);
use Wikibase::Datatype::Mediainfo;
use Wikibase::Datatype::Reference;
use Wikibase::Datatype::Sitelink;
use Wikibase::Datatype::Snak;
use Wikibase::Datatype::Statement;
use Wikibase::Datatype::Value::Item;
use Wikibase::Datatype::Value::Monolingual;
use Wikibase::Datatype::Value::String;
use Wikibase::Datatype::Value::Time;

# Object.
my $statement1 = Wikibase::Datatype::Statement->new(
        # instance of (P31) human (Q5)
        'snak' => Wikibase::Datatype::Snak->new(
                'datatype' => 'wikibase-item',
                'datavalue' => Wikibase::Datatype::Value::Item->new(
                        'value' => 'Q5',
                ),
                'property' => 'P31',
        ),
        'property_snaks' => [
                # of (P642) alien (Q474741)
                Wikibase::Datatype::Snak->new(
                        'datatype' => 'wikibase-item',
                        'datavalue' => Wikibase::Datatype::Value::Item->new(
                                'value' => 'Q474741',
                        ),
                        'property' => 'P642',
                ),
        ],
        'references' => [
                Wikibase::Datatype::Reference->new(
                        'snaks' => [
                                # stated in (P248) Virtual International Authority File (Q53919)
                                Wikibase::Datatype::Snak->new(
                                        'datatype' => 'wikibase-item',
                                        'datavalue' => Wikibase::Datatype::Value::Item->new(
                                                'value' => 'Q53919',
                                        ),
                                        'property' => 'P248',
                                ),

                                # VIAF ID (P214) 113230702
                                Wikibase::Datatype::Snak->new(
                                        'datatype' => 'external-id',
                                        'datavalue' => Wikibase::Datatype::Value::String->new(
                                                'value' => '113230702',
                                        ),
                                        'property' => 'P214',
                                ),

                                # retrieved (P813) 7 December 2013
                                Wikibase::Datatype::Snak->new(
                                        'datatype' => 'time',
                                        'datavalue' => Wikibase::Datatype::Value::Time->new(
                                                'value' => '+2013-12-07T00:00:00Z',
                                        ),
                                        'property' => 'P813',
                                ),
                        ],
                ),
        ],
);
my $statement2 = Wikibase::Datatype::Statement->new(
        # sex or gender (P21) male (Q6581097)
        'snak' => Wikibase::Datatype::Snak->new(
                'datatype' => 'wikibase-item',
                'datavalue' => Wikibase::Datatype::Value::Item->new(
                        'value' => 'Q6581097',
                ),
                'property' => 'P21',
        ),
        'references' => [
                Wikibase::Datatype::Reference->new(
                        'snaks' => [
                                # stated in (P248) Virtual International Authority File (Q53919)
                                Wikibase::Datatype::Snak->new(
                                        'datatype' => 'wikibase-item',
                                        'datavalue' => Wikibase::Datatype::Value::Item->new(
                                                'value' => 'Q53919',
                                        ),
                                        'property' => 'P248',
                                ),

                                # VIAF ID (P214) 113230702
                                Wikibase::Datatype::Snak->new(
                                        'datatype' => 'external-id',
                                        'datavalue' => Wikibase::Datatype::Value::String->new(
                                                'value' => '113230702',
                                        ),
                                        'property' => 'P214',
                                ),

                                # retrieved (P813) 7 December 2013
                                Wikibase::Datatype::Snak->new(
                                        'datatype' => 'time',
                                        'datavalue' => Wikibase::Datatype::Value::Time->new(
                                                'value' => '+2013-12-07T00:00:00Z',
                                        ),
                                        'property' => 'P813',
                                ),
                        ],
                ),
        ],
);

# Main mediainfo.
my $obj = Wikibase::Datatype::Mediainfo->new(
        'id' => 'M16041229',
        'labels' => [
                Wikibase::Datatype::Value::Monolingual->new(
                        'language' => 'cs',
                        'value' => decode_utf8('Pláž Papagayo, ostrov Lanzarote, Kanárské ostrovy, Španělsko'),
                ),
        ],
        'lastrevid' => 528085091,
        'modified' => '2021-01-24T11:44:10Z',
        'page_id' => 16041229,
        'statements' => [
                $statement1,
                $statement2,
        ],
        'title' => 'File:Lanzarote 1 Luc Viatour.jpg',
);

# Print out.
print "Title: ".$obj->title."\n";
print 'Id: '.$obj->id."\n";
print 'Page id: '.$obj->page_id."\n";
print 'Modified: '.$obj->modified."\n";
print 'Last revision id: '.$obj->lastrevid."\n";
print "Labels:\n";
foreach my $label (sort { $a->language cmp $b->language } @{$obj->labels}) {
        print "\t".encode_utf8($label->value).' ('.$label->language.")\n";
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
# Title: File:Lanzarote 1 Luc Viatour.jpg
# Id: M16041229
# Page id: 16041229
# Modified: 2021-01-24T11:44:10Z
# Last revision id: 528085091
# Labels:
#         Pláž Papagayo, ostrov Lanzarote, Kanárské ostrovy, Španělsko (cs)
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