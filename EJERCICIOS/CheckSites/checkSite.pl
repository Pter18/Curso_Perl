#!/usr/bin/perl
<< '#';
Plan de Becarios Generacion 13 Seguridad Informatica
Curso: Programacion con Perl
Alumno: Pedro Alejandro Rodriguez Gallardo
#

use LWP::Simple;
# Abrimos archivo que contiene los sitios
open(FSITES,'feed.txt') or die ("Error al abrir el archivo\n");
# Creamos el archivo que guardara los sitios activos
open(SA, '>', "active_pages.txt") or die ("No se pudo crear el archivo\n");
foreach $site (<FSITES>){
    # Consultamos el sitio, solo consultamos la cabecera para que sea mas rapido el analisis.
    if (! head($site)){
        # Si no esta activo nos notificara.
        print "Esta desactivado el sitio: $site"
    }
    else{
        # De lo contrario lo guardara en un un archivo.
        print SA "$site";
    }
}
close(FSITES);
close(SA);