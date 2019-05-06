#!/usr/bin/perl

<< '#';
Plan de Becarios Generacion 13 Seguridad Informatica
Curso: Programacion con Perl
Alumno: Pedro Alejandro Rodriguez Gallardo
#
q{
# Descarga el index de la pagina
my $url = 'https://openphish.com';
system "wget $url"; 
};

use LWP::Simple; 
while (1){
    print "Descargando Archvo...";
    getstore("https://openphish.com/feed.txt", "feed.txt");
    sleep 300;
}