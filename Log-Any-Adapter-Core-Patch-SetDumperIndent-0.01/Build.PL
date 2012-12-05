
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Set Data::Dumper indent",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Log-Any-Adapter-Core-Patch-SetDumperIndent",
  "dist_version" => "0.01",
  "license" => "perl",
  "module_name" => "Log::Any::Adapter::Core::Patch::SetDumperIndent",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Log::Any" => "0.14",
    "Module::Patch" => "0.12",
    "perl" => "5.010001"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
