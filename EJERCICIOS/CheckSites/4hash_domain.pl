#!/usr/bin/perl

<<'#';
Plan de Becarios Generacion 13 Seguridad Informatica
Curso: Programacion con Perl
Alumno: Pedro Alejandro Rodriguez Gallardo

Fuentes:
https://www.perlmonks.org/?node_id=347308
https://qntm.org/files/perl/perl.html
http://www.perltutorial.org/perl-hash/
https://www.oreilly.com/library/view/perl-cookbook/1565922433/ch05s06.html
#
use LWP::Simple;

open(SITES,"active_pages.txt") or die ("No se pudo leer el archivo");
@sites = <SITES>;
@unique_sites=();
%hash_sites;

foreach $url (@sites){
    my ($domain) = $url =~ m|^( .*?\. [^/]+ )|x;
    @array_sites=();
    foreach $url1 (@sites){
        if ($url1 =~m/$domain/){
            push(@array_sites,$url1);
        }
    }
    #print "Nuevo array\n";
    #print @array_sites; 
    $hash_sites{$domain} = [@array_sites]; 
}
# Imprimiendo hash
while (($key,$value) = each %hash_sites){
    print "$key: \n";
    foreach my $item (@{$hash_sites{$key}}){
        print "$item";
    }
    print "\n";
}