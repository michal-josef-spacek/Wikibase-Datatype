package Wikibase::Datatype::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_array_object check_entity check_isa
	check_number check_number_of_items check_property check_required);

our $VERSION = 0.01;

sub check_array_object {
	my ($self, $key, $class, $class_name) = @_;

	if ($self->{$key}) {
		if (ref $self->{$key} ne 'ARRAY') {
			err "Parameter '".$key."' must be a array.";
		} else {
			foreach my $obj (@{$self->{$key}}) {
				if (! $obj->isa($class)) {
					err $class_name." isn't '".$class."' object.";
				}
			}
		}
	}

	return;
}

sub check_entity {
	my ($self, $key) = @_;

	if ($self->{$key} !~ m/^Q\d+$/ms) {
		err "Parameter '$key' must begin with 'Q' and number after it.";
	}

	return;
}

sub check_isa {
	my ($self, $key, $class) = @_;

	if (! $self->{$key}->isa($class)) {
		err "Parameter '$key' must be a '$class' object.";
	}

	return;
}

sub check_number {
	my ($self, $key) = @_;

	if ($self->{$key} !~ m/^-?\d+$/ms) {
		err "Parameter '$key' must be a number.";
	}

	return;
}

sub check_number_of_items {
	my ($self, $list_method, $item_method, $object_name, $item_name) = @_;

	my $item_hr = {};
	foreach my $item (@{$self->$list_method}) {
		$item_hr->{$item->$item_method} += 1;
	}

	foreach my $item (keys %{$item_hr}) {
		if ($item_hr->{$item} > 1) {
			err "$object_name for $item_name '$item' has multiple values."
		}
	}

	return;
}

sub check_property {
	my ($self, $key) = @_;

	if ($self->{$key} !~ m/^P\d+$/ms) {
		err "Parameter '$key' must begin with 'P' and number after it.";
	}

	return;
}

sub check_required {
	my ($self, $key) = @_;

	if (! defined $self->{$key}) {
		err "Parameter '$key' is required.";
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikibase::Datatype::Utils - Wikibase datatype utilities.

=head1 SYNOPSIS

 use Wikibase::Datatype::Utils qw(check_array_object check_entity check_isa check_number check_required);

 check_array_object($self, $key, $class, $class_name);
 check_entity($self, $key);
 check_isa($self, $key, $class);
 check_number($self, $key);
 check_number_of_items($self, $list_method, $item_method, $object_name, $item_name);
 check_property($self, $key);
 check_required($self, $key);

=head1 DESCRIPTION

Datatype utilities for checking of data objects.

=head1 SUBROUTINES

=head2 C<check_array_object>

 check_array_object($self, $key, $class, $class_name);

Check parameter defined by C<$key> which is reference to array with instances
of some object type (C<$class>). C<$class_name> is used to error message.

Put error if check isn't ok.

Returns undef.

=head2 C<check_entity>

 check_entity($self, $key);

Check parameter defined by C<$key> whith is entity (/^Q\d+/).

Returns undef.

=head2 C<check_isa>

 check_isa($self, $key, $class);

Check parameter defined by C<$key> which is instance of C<$class> or no.

Put error if check isn't ok.

Returns undef.

=head2 C<check_number>

 check_number($self, $key);

Check parameter defined by C<$key> which is number (positive or negative) or no.

Put error if check isn't ok.

Returns undef.

=head2 C<check_number_of_items)

 check_number_of_items($self, $list_method, $item_method, $object_name, $item_name);

Check number of items. Must be 0 or 1. List items via C<$list_method> and get
value via C<$item_method> method. C<$object_name> and C<$item_name> are
variables for error output.

Put error if check isn't ok.

Returns undef.

=head2 C<check_property>

 check_property($self, $key);

Check parameter defined by C<$key> whith is property (/^P\d+/).

Returns undef.

=head2 C<check_required>

 check_required($self, $key);

Check required parameter defined by C<$key>.

Put error if check isn't ok.

Returns undef.

=head1 ERRORS

 check_array_object():
         Parameter '%s' must be a array.
         %s isn't '%s' object.

 check_entity():
         Parameter '%s' must begin with 'Q' and number after it.";

 check_isa():
         Parameter '%s' must be a '%s' object.

 check_number():
         Parameter '%s' must a number.

 check_number_of_items():
         %s for %s '%s' has multiple values.

 check_property():
         Parameter '%s' must begin with 'P' and number after it.";

 check_required():
         Parameter '%s' is required.

=head1 EXAMPLE1

 use strict;
 use warnings;

 use Wikibase::Datatype::Utils qw(check_array_object);
 use Wikibase::Datatype::Value;

 my $self = {
         'key' => [
                 Wikibase::Datatype::Value->new(
                         'value' => 'Text value',
                 ),
         ],
 };
 check_array_object($self, 'key', 'Wikibase::Datatype::Value', 'Value');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE2

 use strict;
 use warnings;

 use Error::Pure;
 use Wikibase::Datatype::Utils qw(check_array_object);
 use Wikibase::Datatype::Value;

 $Error::Pure::TYPE = 'Error';

 my $self = {
         'key' => [
                 Wikibase::Datatype::Value->new(
                         'value' => 'Text value',
                 ),
         ],
 };
 check_array_object($self, 'key', 'Wikibase::Datatype::Snak', 'Snak');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [/../Wikibase/Datatype/Utils.pm:?] Snak isn't 'Wikibase::Datatype::Snak' object.

=head1 EXAMPLE3

 use strict;
 use warnings;

 use Wikibase::Datatype::Utils qw(check_entity);

 my $self = {
         'key' => 'Q123',
 };
 check_entity($self, 'key');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE4

 use strict;
 use warnings;

 use Error::Pure;
 use Wikibase::Datatype::Utils qw(check_entity);

 $Error::Pure::TYPE = 'Error';

 my $self = {
         'key' => 'bad_entity',
 };
 check_entity($self, 'key');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [/../Wikibase/Datatype/Utils.pm:?] Parameter 'key' must begin with 'Q' and number after it.

=head1 EXAMPLE5

 use strict;
 use warnings;

 use Wikibase::Datatype::Utils qw(check_isa);
 use Wikibase::Datatype::Value;

 my $self = {
         'key' => Wikibase::Datatype::Value->new(
                 'value' => 'foo',
         ),
 };
 check_isa($self, 'key', 'Wikibase::Datatype::Value');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE6

 use strict;
 use warnings;

 $Error::Pure::TYPE = 'Error';

 use Wikibase::Datatype::Utils qw(check_isa);
 use Wikibase::Datatype::Value;

 my $self = {
         'key' => 'foo',
 };
 check_isa($self, 'key', 'Wikibase::Datatype::Value');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [/../Wikibase/Datatype/Utils.pm:?] Parameter 'key' must be a 'Wikibase::Datatype::Value' object.

=head1 EXAMPLE7

 use strict;
 use warnings;

 use Wikibase::Datatype::Utils qw(check_number);

 my $self = {
         'key' => '10',
 };
 check_number($self, 'key');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE8

 use strict;
 use warnings;

 $Error::Pure::TYPE = 'Error';

 use Wikibase::Datatype::Utils qw(check_number);

 my $self = {
         'key' => 'foo',
 };
 check_number($self, 'key');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [/../Wikibase/Datatype/Utils.pm:?] Parameter 'key' must be a number.

=head1 EXAMPLE9

 use strict;
 use warnings;

 use Wikibase::Datatype::Utils qw(check_property);

 my $self = {
         'key' => 'P123',
 };
 check_property($self, 'key');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE10

 use strict;
 use warnings;

 use Error::Pure;
 use Wikibase::Datatype::Utils qw(check_property);

 $Error::Pure::TYPE = 'Error';

 my $self = {
         'key' => 'bad_property',
 };
 check_property($self, 'key');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [/../Wikibase/Datatype/Utils.pm:?] Parameter 'key' must begin with 'P' and number after it.

=head1 EXAMPLE11

 use strict;
 use warnings;

 use Wikibase::Datatype::Utils qw(check_required);

 my $self = {
         'key' => 'value',
 };
 check_required($self, 'key');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE12

 use strict;
 use warnings;

 use Error::Pure;
 use Wikibase::Datatype::Utils qw(check_required);

 $Error::Pure::TYPE = 'Error';

 my $self = {
         'key' => undef,
 };
 check_required($self, 'key');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [/../Wikibase/Datatype/Utils.pm:?] Parameter 'key' is required.

=head1 DEPENDENCIES

L<Exporter>,
L<Error::Pure>,
L<Readonly>.

=head1 SEE ALSO

=over

=item L<Wikibase::Datatype>

Wikibase datatypes.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Wikibase-Datatype>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2020

BSD 2-Clause License

=head1 VERSION

0.01

=cut
