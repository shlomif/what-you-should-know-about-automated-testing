#!/usr/bin/perl

use strict;
use warnings;

use Test::HTML::Tidy tests => 1;
use Text::Markdown qw/ markdown /;
use Path::Tiny qw/ path /;

my $HTML = join('',
    <<"EOF",
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE
    html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US">
<head>
<title>Testing</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
EOF
    markdown( path( "./README.md" )->slurp_utf8 ),
    <<"EOF",
</body>
</html>
EOF
);

my $tidy = HTML::Tidy->new( { output_xhtml => 1, } );

# TEST
html_tidy_ok($tidy, $HTML, "From markdown");
