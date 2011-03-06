#!perl

use Test::More tests => 1;

BEGIN {
    use_ok( 'App::DesktopDroidServer' ) || print "Bail out!
";
}

diag( "Testing App::DesktopDroidServer $App::DesktopDroidServer::VERSION, Perl $], $^X" );
