#!/usr/bin/perl -l

use strict;
use warnings;

if (scalar @ARGV < 1 or not -d $ARGV[0]) {
    print "nope";
    exit 1;
}

opendir my $DIRHANDLE, $ARGV[0] or die "can't opendir $ARGV[0]: $!";

my $counter = 0;
my @s = ();

foreach (readdir $DIRHANDLE) {

    if (-f $_) {
        @s = stat $_;
        $counter += $s[7];
        print("La taille du fichier $_ est de $s[7]");
    }
}

closedir $DIRHANDLE;
print("Taille totale des fichiers du répertoire $ARGV[0] : $counter");
