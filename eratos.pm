package Eratosthene;

use Moose;

has 'liste_a_traiter' => (isa => 'ArrayRef[Int]', is => 'rw', required => 1);
has 'premier' => (isa => 'ArrayRef[Int]', is => 'rw');

#sub new {
#    my ($selftype, $nombre) = @_;
#    return bless {liste_a_traiter => [2..$nombre],
#                    premier => []}, $selftype;
#}

sub crible {

    my $self = shift;
    my $candidat = ();

    my @lat = @{$self->{liste_a_traiter}};

    while (@lat > 0) {

        next unless $candidat = shift @lat;
        push @{$self->{premier}}, $candidat;

        foreach my $i (0..@lat-1) {
            next if !defined $lat[$i];
            $lat[$i] = undef if $lat[$i] % $candidat == 0;
        }
    }

    return $self->{premier};
}

1;

