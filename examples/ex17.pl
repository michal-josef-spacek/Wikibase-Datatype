#!/usr/bin/env perl

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