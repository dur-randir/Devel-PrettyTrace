use Test::More tests => 1;

use Devel::PrettyTrace;
use lib 't/inc';
$Devel::PrettyTrace::Opts{colored} = 0;

my $f;
sub z{
	$f = bt;
}

eval 'use Foo';
$f =~ s/eval \d+/eval/;
is($f, '  main::z() called at t/inc/Foo.pm line 4
  Foo::import(
    [0] "Foo"
  ) called at (eval) line 2
  main::BEGIN() called at t/inc/Foo.pm line 2
  eval {...} called at t/inc/Foo.pm line 2
  eval \'use Foo;\' called at t/04_begin.t line 12
');
