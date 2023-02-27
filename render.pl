#! /usr/bin/env perl
#
# Short description for render-cosmology.pl
#
# Version 0.0.1
# Copyright (C) 2022 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the NOASSERTION license.

use strict;
use warnings;
use 5.014;
use autodie;

# use lib '../../trunk/lib';
use Path::Tiny qw/ path tempdir tempfile cwd /;

# use Shlomif::MySystem qw/ my_system /;

sub my_system
{
    my $cmd = shift;
    my $err = shift || '';

    # print join( ' ', @$cmd ), "\n";
    if ( system(@$cmd) )
    {
        die "<<@$cmd>> failed $err.";
    }
}

sub my_exec_perl
{
    my ( $cmd, $err ) = @_;

    return my_system( [ $^X, '-Ilib', @$cmd ], $err );
}

my $repo = 'docbookrx';

if ( not -e $repo )
{
    my_system(
        [
"set -e -x ; git clone -b shlomify1 https://github.com/shlomif/docbookrx ; cd $repo ; bundle --path=.bundle/gems",
        ],
        "git clone",
    );
}
foreach my $basename (
    qw#
    what-you-should-know-about-automated-testing.docbook5.xml

    #
    )
{
    # body...
    my_system(
        [ "set -e -x ; cd $repo ; bundle exec docbookrx ../${basename}", ],
        "render", );
    my $adoc = $basename;
    $adoc =~ s#\.docbook5\.xml\z#.docbook5.adoc#ms or die;
    my $asciidoc = "README.asciidoc";
    path($adoc)->copy($asciidoc);
}
