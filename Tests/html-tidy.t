#!/usr/bin/perl

use strict;
use warnings;

use Test::HTML::T5 tests => 1;
use Path::Tiny qw/ path /;

my $HTML = path( glob("what-you-should-know-about-automated-testing/*.xhtml") )
    ->slurp_utf8();

my $tidy = HTML::T5->new( { output_xhtml => 1, } );

# TEST
html_tidy_ok( $tidy, $HTML, "From markdown" );
