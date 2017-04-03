requires "Code::TidyAll" => "0";
requires "DBIx::Class" => "0";
requires "DBIx::Class::Core" => "0";
requires "DBIx::Class::EncodedColumn" => "0";
requires "DBIx::Class::InflateColumn::DateTime" => "0";
requires "DBIx::Class::Schema" => "0";
requires "DBIx::Class::Schema::Loader" => "0";
requires "DBIx::Class::TimeStamp" => "0";
requires "DateTime" => "0";
requires "SQL::Abstract" => "0";
requires "base" => "0";
requires "experimental" => "0";
requires "overload" => "0";
requires "perl" => "5.012";
requires "strict" => "0";
requires "utf8" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::Spec" => "0";
  requires "Test::DBIx::Class" => "0";
  requires "Test::More" => "0";
  requires "perl" => "5.012";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.17";
  requires "perl" => "5.012";
};

on 'configure' => sub {
  suggests "JSON::PP" => "2.27300";
};

on 'develop' => sub {
  requires "Dist::Zilla" => "5";
  requires "Dist::Zilla::Plugin::Prereqs" => "0";
  requires "Dist::Zilla::PluginBundle::DAGOLDEN" => "0";
  requires "English" => "0";
  requires "File::Spec" => "0";
  requires "File::Temp" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "OpenCloset::Config" => "0.005";
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Pod::Wordlist" => "0";
  requires "Software::License::Perl_5" => "0";
  requires "Test::CPAN::Meta" => "0";
  requires "Test::More" => "0";
  requires "Test::Pod" => "1.41";
  requires "Test::Pod::Coverage" => "1.08";
  requires "Test::Portability::Files" => "0";
  requires "Test::Spelling" => "0.12";
  requires "Test::Version" => "1";
  requires "blib" => "1.01";
  requires "perl" => "5.006";
};
