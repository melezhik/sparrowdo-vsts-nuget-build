use v6;

unit module Sparrowdo::VSTS::YAML::Nuget::Build:ver<0.0.1>;

use Sparrowdo;
use Sparrowdo::Core::DSL::Directory;
use Sparrowdo::Core::DSL::File;
use Sparrowdo::Core::DSL::Template;
use Sparrowdo::Core::DSL::Bash;

our sub tasks (%args) {

  my $build-dir = %args<build-dir> || die "usage module_run '{ ::?MODULE.^name }' ,%(build-dir => dir)";

  directory "$build-dir/.cache";

  file "$build-dir/files/nuget-pack.bat", %( content => slurp %?RESOURCES<nuget-pack>.Str );

  template-create "$build-dir/.cache/build.yaml.sample", %(
    source => ( slurp %?RESOURCES<build.yaml> ),
    variables => %( 
      project_file => %args<project_file>,
      project_folder => %args<project-folder>,
      base_dir => "$build-dir/files",
      configuration => %args<configuration> || "Release",
    )
  );

  bash "cat $build-dir/.cache/build.yaml.sample >> $build-dir/build.yaml"

}


