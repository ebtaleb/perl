#!/usr/bin/perl

use strict;
use warnings;
use Scalar::Util qw(looks_like_number);
use Getopt::Std;

my %Options = ();
my %hash = ();
my @lines = ();
my $sep = undef;
my $field_num = undef;
my @str_array = ();

my @sorted_field_arr = ();
my @arr_of_fields  = ();

getopt('tk', \%Options);

while (<>) {

    push @lines, $_;

    if (exists $hash{$_}) {
        # do nothing
    } else {
        $hash{ $_ } = ();
    }
}

@str_array = sort @lines;

if ($Options{'n'}) {
    &num_sort(\@str_array);
}

if ($Options{'r'}) {
    @str_array =  reverse @str_array;
}

if ($Options{'u'}) {
    @str_array = sort keys %hash;

    if ($Options{'n'}) {
        @str_array = sort { $a <=> $b } @str_array;
    }

    if ($Options{'r'}) {
        @str_array = reverse @str_array;
    }
}

if ($Options{'u'} || $Options{'n'} || $Options{'r'}) {
    print @str_array;
}

if ($Options{'k'}) {

    $field_num = $Options{'k'};

    if ($Options{'t'}) {
        $sep = qr/$Options{'t'}/;
    } else {
        $sep = qr/ /;
    }

    @arr_of_fields = map  { [ $_, (split $sep)[0..$field_num] ] } @lines;

    if (looks_like_number($arr_of_fields[0][$field_num])) {
        @sorted_field_arr = sort { $a->[$field_num] <=> $b->[$field_num] } @arr_of_fields;
    } else {
        @sorted_field_arr = sort { $a->[$field_num] cmp $b->[$field_num] } @arr_of_fields ;
    }

    print map { $_->[0] } @sorted_field_arr;
    exit 0;

}

if ($Options{'t'}) {

    $sep = qr/$Options{'t'}/;

    my @arr_of_fields = map  { [ $_, (split $sep)[0..1] ] } @lines;

    if (looks_like_number($arr_of_fields[0][1])) {
        @sorted_field_arr = sort { $a->[1] <=> $b->[1] } @arr_of_fields;
    } else {
        @sorted_field_arr = sort { $a->[1] cmp $b->[1] } @arr_of_fields ;
    }

    print map { $_->[0] } @sorted_field_arr;

}

# option -n
sub num_sort() {
    my ($arr) = @_;
    @$arr = sort { $a <=> $b } @$arr;
}

