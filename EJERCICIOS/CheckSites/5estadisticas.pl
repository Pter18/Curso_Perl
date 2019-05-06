#!/usr/bin/perl

<<'#';
Plan de Becarios Generacion 13 Seguridad Informatica
Curso: Programacion con Perl
Alumno: Pedro Alejandro Rodriguez Gallardo

Fuentes:
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

open (my $reporte, '>', "reporte.txt") or die "No se pudo crear el archivo";
foreach my $key (sort{scalar(@{$hash_sites{$b}}) <=> scalar(@{$hash_sites{$a}})} keys %hash_sites){
    print $reporte "$key tiene: ", scalar @{$hash_sites{$key}}, " sitios\n";
    foreach my $item (@{$hash_sites{$key}}){
        print $reporte "$item";
    }
    print $reporte "\n";
}
close($reporte);