#!/usr/bin/perl

<<'#';
Plan de Becarios Generacion 13 Seguridad Informatica
Curso: Programacion con Perl
Alumno: Pedro Alejandro Rodriguez Gallardo

Fuentes:
https://www.fireeye.com/content/dam/fireeye-www/global/en/current-threats/pdfs/rpt-top-spear-phishing-words.pdf
https://gcn.com/articles/2012/09/26/20-most-common-words-phishing-attacks.aspx
#
use LWP::Simple;

open(SITES, "active_pages.txt") or die ("No se pudo abrir el archivo\n");
@phishing_words=("password","pass","account","user","dhl","delivery","express","label","confirmation","report","alert","idnotification","card","credit","usuario","ticket","shipping","mail","email","ups","fedex","financial","postal","document");
@full_sites = <SITES>;
for (my $i = 0; $i < 5; $i++) {
        my $randomvalue = @full_sites[rand @full_sites];
        push(@new_sites,$randomvalue);
}
foreach $site (@new_sites){
	print "Sitio: $site";
	foreach $word (@phishing_words){
		$sc = get($site);
		if ($sc =~m/$word/){
			print "Fue encontrada la palabra: $word \n";
		}   
	}
    print "\n";
}


