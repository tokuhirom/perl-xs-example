package Foo;
use 5.008000;
use strict;
use warnings;
our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Foo', $VERSION);

1;
