#!/usr/bin/perl -l
#
use strict;
use warnings;

my @path = split(/\//, $ARGV[0]);
my $basen = $path[-1];

if ($ARGV[1]) {
    $basen =~ s/(.*)$ARGV[1]$/$1/gs;
}

print $basen;
