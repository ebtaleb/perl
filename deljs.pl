#!/usr/bin/perl -l

use strict;
use warnings;

$/ = undef;
my $text = <>;
$text =~ s/<script type="text\/javascript".*?<\/script>//gs;
print $text;
