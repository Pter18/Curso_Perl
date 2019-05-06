#!/usr/bin/perl -w
use strict;
use warnings;
 
use GD::Graph::bars;
use GD::Graph::Data;
# Datos de entrada:
my $data = GD::Graph::Data->new([
    ["1st","2nd","3rd","4th","5th","6th","7th", "8th", "9th"],
    [    4,    1,    9,    10,    2,  3.8,    5,     2,     12],
]) or die GD::Graph::Data->error;

# Creo mi grafica 
my $graph = GD::Graph::bars->new;

# Configuro los parametros de la grafica 
$graph->set( 
    x_label         => 'Eje X',
    y_label         => 'Eje Y',
    title           => 'Grafica de prueba',
) or die $graph->error;
# Grafico los datos sobre la grafica 
$graph->plot($data) or die $graph->error;

# Salida en formato PNG
my $file = 'grafica.png';
open(my $out, '>', $file) or die "No se puede abrir '$file' para escribir: $!";
binmode $out;
print $out $graph->gd->png;
close $out;