#!/usr/bin/perl -lw

use eratos;
$, = " ";

$obj1 = Eratosthene->new(liste_a_traiter=>[2..10]);
$obj2 = Eratosthene->new(liste_a_traiter=>[2..30]);
print @{$obj1->crible()};
print @{$obj2->crible()};

