#!/usr/bin/env perl
use strict;
use warnings;

#Funcion para Match con IPs
sub match_ip(){
  my $line2=shift;
  if ($line2 =~ /\b(\d{1,3}(?:\.\d{1,3}){3})\b/)
  {
      print "$1\n";
  }
  return $1;
}

print "¿Cual es tu segmento de red a escanear? ";
chomp( my $ip = <STDIN> );
my $network = $ip . '/24';

open(FILE,'>','nmap_output.txt')
  or die "No se puede abrir 'nmap_output.txt' para escribir: $!";

my $output = qx{nmap -sP $network};
print $output;;
my @lines = split /\n/, $output;
foreach my $line( @lines ) { 
    my $result = &match_ip($line);
    if (defined $result){
        print FILE "$result   up\n";
    }
}
close(FILE);
