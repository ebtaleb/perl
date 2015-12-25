#!/usr/bin/perl -l

use strict;
use warnings;

$/ = undef;
my $text = <>;
#$text =~ m[(.+).*\1] and print length $1 and print $1;
$text =~ /^(.*?)s/ and print $1 and print "derp";
