use strict;
use warnings;

use 5.012;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "OpenCloset Database Schema Class",
  "AUTHOR" => "\x{ae40}\x{b3c4}\x{d615} - Keedi Kim <keedi\@cpan.org>, \x{d64d}\x{d615}\x{c11d} - Hyungsuk Hong <aanoaa\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "OpenCloset-Schema",
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.012",
  "NAME" => "OpenCloset::Schema",
  "PREREQ_PM" => {
    "Code::TidyAll" => 0,
    "DBIx::Class" => 0,
    "DBIx::Class::Core" => 0,
    "DBIx::Class::EncodedColumn" => 0,
    "DBIx::Class::InflateColumn::DateTime" => 0,
    "DBIx::Class::Schema" => 0,
    "DBIx::Class::Schema::Loader" => 0,
    "DBIx::Class::TimeStamp" => 0,
    "DateTime" => 0,
    "SQL::Abstract" => 0,
    "base" => 0,
    "experimental" => 0,
    "overload" => 0,
    "strict" => 0,
    "utf8" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "Test::DBIx::Class" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.050",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Code::TidyAll" => 0,
  "DBIx::Class" => 0,
  "DBIx::Class::Core" => 0,
  "DBIx::Class::EncodedColumn" => 0,
  "DBIx::Class::InflateColumn::DateTime" => 0,
  "DBIx::Class::Schema" => 0,
  "DBIx::Class::Schema::Loader" => 0,
  "DBIx::Class::TimeStamp" => 0,
  "DateTime" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "SQL::Abstract" => 0,
  "Test::DBIx::Class" => 0,
  "Test::More" => 0,
  "base" => 0,
  "experimental" => 0,
  "overload" => 0,
  "strict" => 0,
  "utf8" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
