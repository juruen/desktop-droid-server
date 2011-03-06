use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'App::DesktopDroidServer',
    AUTHOR              => q{Javier Uruen Val <juruen@warp.es>},
    VERSION_FROM        => 'lib/App/DesktopDroidServer.pm',
    ABSTRACT_FROM       => 'lib/App/DesktopDroidServer.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'gpl')
      : ()),
    PL_FILES            => {},
    EXE_FILES => ['desktop-droid-server'],
    PREREQ_PM => {
        'Mojolicious::Lite' => 0,
        'Test::More' => 0,
        
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'App-DesktopDroidServer-*' },
);
