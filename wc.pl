#! /usr/bin/perl -s

#use strict;
#use warnings;    
my $res=0;
if ($c){
    while(<>){

	$res+=length;
    }
}
if ($w){
    while(<>){
	$res+=split;
    }
}
if ($l){
    while(<>){	
	$res+=1;
    }
}
print $res;
