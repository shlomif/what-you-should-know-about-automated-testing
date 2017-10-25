#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

use Test::TrailingSpace ();

my $finder = Test::TrailingSpace->new(
    {
        root => '.',
        filename_regex =>
qr/(?:(?:\.(?:md|mkdn|markdown|t|pm|pl|PL|yml|json|arc|vim))|README|Changes|LICENSE|MANIFEST)\z/,
    },
);

# TEST
$finder->no_trailing_space( "No trailing space was found." );
