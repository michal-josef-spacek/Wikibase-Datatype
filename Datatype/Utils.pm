package Wikidata::Datatype::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_array_object check_required);

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

sub check_required {
	my ($self, $key) = @_;

	if (! defined $self->{$key}) {
		err "Parameter '$key' is required.";
	}

	return;
}

1;

__END__
