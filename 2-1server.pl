#!/usr/bin/perl -w

use strict;
use Socket;

my $port = shift;
$port =~ /^(\d)+$/ or die "invalid port";
my $server = "localhost"; # Host IP running the server

# create a socket, make it reusable
socket(Server, PF_INET, SOCK_STREAM, getprotobyname('tcp'))
    or die "Can’t open socket $!\n";

setsockopt(Server, SOL_SOCKET, SO_REUSEADDR, 1)
    or die "Can’t set socket option to SO_REUSEADDR $!\n";

# bind to a port, then listen
bind( Server, pack_sockaddr_in($port, inet_aton($server)))
    or die "Can’t bind to port $port! \n";

listen(Server, 10) or die "listen: $!";
print "SERVER started on port $port\n";

# accepting a connection
my $paddr;
for (; $paddr = accept(Client, Server); close Client) {

    my ($port, $iaddr) = sockaddr_in($paddr);
    my $name = gethostbyaddr($iaddr,AF_INET);
    print "Connection received from $name [", inet_ntoa($iaddr), "] at port $port";

    while (my $line = <Client>) {
        print "j'envoie $line au client";
        send Client, $line, "";
    }
}

