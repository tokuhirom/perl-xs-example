use strict;
use warnings;
use Foo;
use Test::More tests => 3;

my $f = Foo->new();
is $f->val(), 0;
$f->add(3);
is $f->val(), 3;
$f->add(4);
is $f->val(), 7;

