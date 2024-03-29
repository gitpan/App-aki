use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    name                => 'App-aki',
    module_name         => 'App::aki',
    license             => 'perl',
    dist_author         => 'Dai Okabayashi <bayashi@cpan.org>',
    dist_version_from   => 'lib/App/aki.pm',
    configure_requires  => {
        'Module::Build' => 0.38,
    },
    build_requires      => {
        'Test::More' => 0.88,
        'Test::Mock::LWP' => 0,
        'Capture::Tiny' => 0,
        'Exporter' => 0,
        'Test::Fake::HTTPD' => 0,
        'HTTP::Response' => 0,
        'File::Temp' => 0,
    },
    requires => {
        'perl' => '5.008005',
        'Getopt::Long' => 0,
        'Pod::Usage' => 0,
        'LWP::UserAgent' => 0,
        'HTTP::Request' => 0,
        'HTTP::Cookies' => 0,
        'Data::Printer' => 0,
        'JSON::Pointer' => 0,
        'JSON' => 0,
        'XML::TreePP' => 0,
        'YAML::Syck' => 0,
        'Data::MessagePack' => 0,
        'Encode' => 0,
        'File::Spec' => 0,
        'Config::CmdRC' => 0.06,
    },
    script_files        => [ 'script/aki' ],
    add_to_cleanup      => [ 'App-aki-*' ],
    meta_merge     => {
      resources => {
        repository  => 'http://github.com/bayashi/App-aki',
        bugtracker  => 'http://github.com/bayashi/App-aki/issues',
      }
    },
    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? ['t/', 'xt/'] : ['t/'],
    recursive_test_files => 1,
);

$builder->create_build_script();
