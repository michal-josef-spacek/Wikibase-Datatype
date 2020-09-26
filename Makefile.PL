use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Wikidata data types.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Wikidata-Datatype';
perl_version 5.006002;
readme_from 'Datatype.pm';
recursive_author_tests('xt');
requires 'Class::Utils' => 0.03;
requires 'Error::Pure' => 0.15;
requires 'MediaWiki::API' => 0;
requires 'JSON::XS' => 0;
requires 'Unicode::UTF8' => 0;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Wikidata-Datatype/issues',
resources 'homepage' => 'https://github.com/michal-josef-spacek/Wikidata-Datatype';
resources 'repository' => 'git://github.com/michal-josef-spacek/Wikidata-Datatype';
test_requires 'English' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
