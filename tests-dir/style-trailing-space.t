#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

use Test::TrailingSpace ();

my $finder = Test::TrailingSpace->new(
    {
        abs_path_prune_re => qr#\Adocbookrx#,
        filename_regex    =>
qr/(?:(?:\.(?:md|mkdn|markdown|t|pm|pl|PL|yml|json|arc|vim))|README|Changes|LICENSE|MANIFEST)\z/,
        root => '.',
    },
);

# TEST
$finder->no_trailing_space("No trailing space was found.");
