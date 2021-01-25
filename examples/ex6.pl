#!/usr/bin/env perl

use strict;
use warnings;

use Wikibase::Datatype::MediainfoSnak;
use Wikibase::Datatype::MediainfoStatement;
use Wikibase::Datatype::Value::Item;
use Wikibase::Datatype::Value::String;
use Wikibase::Datatype::Value::Time;

# Object.
my $obj = Wikibase::Datatype::MediainfoStatement->new(
        # instance of (P31) human (Q5)
        'snak' => Wikibase::Datatype::MediainfoSnak->new(
                 'datavalue' => Wikibase::Datatype::Value::Item->new(
                         'value' => 'Q5',
                 ),
                 'property' => 'P31',
        ),
        'property_snaks' => [
                # of (P642) alien (Q474741)
                Wikibase::Datatype::MediainfoSnak->new(
                         'datavalue' => Wikibase::Datatype::Value::Item->new(
                                 'value' => 'Q474741',
                         ),
                         'property' => 'P642',
                ),
        ],
);

# Print out.
print 'Statement: '.$obj->snak->property.' -> '.$obj->snak->datavalue->value."\n";
print "Qualifiers:\n";
foreach my $property_snak (@{$obj->property_snaks}) {
        print "\t".$property_snak->property.' -> '.
                $property_snak->datavalue->value."\n";
}
print 'Rank: '.$obj->rank."\n";

# Output:
# Statement: P31 -> Q5
# Qualifiers:
#         P642 -> Q474741
# Rank: normal