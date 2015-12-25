#!/usr/bin/perl -w

use strict;
use Socket;

# initialize host and port
my $host = shift;
my $port = shift;
my $server = "localhost"; # Host IP running the server

# create the socket, connect to the port
socket(SOCKET,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2])
    or die "Can’t create a socket $!\n";
connect( SOCKET, pack_sockaddr_in($port, inet_aton($server)))
    or die "Can’t connect to port $port! \n";

my $rep;
while (<>) {
    print "j'envoie $_";
    print SOCKET $_;
    $| = 1;
    print "message envoyé";
    $rep = <SOCKET>;
    print $rep;
}

close SOCKET or die "close: $!";

