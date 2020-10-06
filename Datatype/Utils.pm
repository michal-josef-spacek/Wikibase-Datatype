package Wikidata::Datatype::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_array_object check_isa check_required);

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

sub check_isa {
	my ($self, $key, $class) = @_;

	if (! $self->{$key}->isa($class)) {
		err "Parameter '$key' must be a '$class' object.";
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

Wikidata::Datatype::Utils - Wikidata datatype utilities.

=head1 SYNOPSIS

 use Wikidata::Datatype::Utils qw(check_array_object check_isa check_required);

 check_array_object($self, $key, $class, $class_name);
 check_isa($self, $key, $class);
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

=head2 C<check_isa>

 check_isa($self, $key, $class);

Check parameter defined by C<$key> which is instance of C<$class> or no.

Put error if check isn't ok.

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

 check_isa():
         Parameter '%s' must be a '%s' object.

 check_required():
         Parameter '%s' is required.

=head1 EXAMPLE1

 use strict;
 use warnings;

 use Wikidata::Datatype::Utils qw(check_array_object);
 use Wikidata::Datatype::Value;

 my $self = {
         'key' => [
                 Wikidata::Datatype::Value->new(
                         'value' => 'Text value',
                 ),
         ],
 };
 check_array_object($self, 'key', 'Wikidata::Datatype::Value', 'Value');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE2

 use strict;
 use warnings;

 use Error::Pure;
 use Wikidata::Datatype::Utils qw(check_array_object);
 use Wikidata::Datatype::Value;

 $Error::Pure::TYPE = 'Error';

 my $self = {
         'key' => [
                 Wikidata::Datatype::Value->new(
                         'value' => 'Text value',
                 ),
         ],
 };
 check_array_object($self, 'key', 'Wikidata::Datatype::Snak', 'Snak');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [/../Wikidata/Datatype/Utils.pm:?] Snak isn't 'Wikidata::Datatype::Snak' object.

=head1 EXAMPLE3

 use strict;
 use warnings;

 use Wikidata::Datatype::Utils qw(check_isa);
 use Wikidata::Datatype::Value;

 my $self = {
         'key' => Wikidata::Datatype::Value->new(
                 'value' => 'foo',
         ),
 };
 check_isa($self, 'key', 'Wikidata::Datatype::Value');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE4

 use strict;
 use warnings;

 $Error::Pure::TYPE = 'Error';

 use Wikidata::Datatype::Utils qw(check_isa);
 use Wikidata::Datatype::Value;

 my $self = {
         'key' => 'foo',
 };
 check_isa($self, 'key', 'Wikidata::Datatype::Value');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [/../Wikidata/Datatype/Utils.pm:?] Parameter 'key' must be a 'Wikidata::Datatype::Value' object.

=head1 EXAMPLE5

 use strict;
 use warnings;

 use Wikidata::Datatype::Utils qw(check_required);

 my $self = {
         'key' => 'value',
 };
 check_required($self, 'key');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE6

 use strict;
 use warnings;

 use Error::Pure;
 use Wikidata::Datatype::Utils qw(check_required);

 $Error::Pure::TYPE = 'Error';

 my $self = {
         'key' => undef,
 };
 check_required($self, 'key');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [/../Wikidata/Datatype/Utils.pm:?] Parameter 'key' is required.

=head1 DEPENDENCIES

L<Exporter>,
L<Error::Pure>,
L<Readonly>.

=head1 SEE ALSO

=over

=item L<Wikidata::Datatype>

Wikidata datatypes

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
