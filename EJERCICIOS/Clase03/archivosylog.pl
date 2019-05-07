#!/usr/bin/perl
use Term::Menus;

sub fecha {
    @date = localtime(time);
    $date[5] += 1900;
    $date[4] ++;
    if ($date[4] <= 10){
        $date[4] = "0$date[4]";
    }
    if ($date[3] <= 10){
        $date[3] = "0$date[3]";
    }
    $time = "$date[5]-$date[4]-$date[3] $date[2]:$date[1]:$date[0]";
    print $time;
    return $time;
}
fecha();
print "Este programa te permite manipular archivos segun la opcion que elijas:\n\n";
while(1){
    my @list=("Borrar","Renombrar","Crear Directorio","Borrar Directorio","Cambiar Permisos");
    my $banner="Selecciona una opcion:";
    my $selection=&pick(\@list,$banner);
    open(LOG,">>","logs.txt") or die "Error no se puede abrir el archivo de logs.txt";
    chomp($selection);
    if ($selection eq "Borrar"){
        print "Nombre del archivo a borrar: ";
        $file = <>;
        chomp($file);
        my $resp = unlink "$file";
        if ($resp == 1){
            print "El archivo $file fue borrado\n";
            $fecha = fecha();
            print LOG "El archivo $file fue borrado $fecha\n";
        }
        elsif ($resp == 0){
            print "El archivo $file no fue borrado\n";
            $fecha = fecha();
            print LOG "El archivo $file no fue borrado $fecha\n "
        }
        sleep(2);
    }
    elsif ($selection eq "Renombrar"){
        print "Nombre del archivo a cambiar el nombre: ";
        $old_name = <>;
        chomp($old_name);
        print "Nuevo nombre del archivo $old_name: ";
        $new_name = <>;
        chomp($new_name);
        my $resp = rename $old_name,$new_name;
        if ($resp == 1){
            print "El archivo $old_name fue renombrado a $new_name\n";
            $fecha = fecha();
            print LOG "El archivo $old_name fue renombrado a $new_name $fecha\n";
        }
        elsif ($resp == 0){
            print "El archivo $old_name no fue remonbrado\n";
            $fecha = fecha();
            print LOG "El archivo $old_name no fue remonbrado $fecha\n "
        }
        sleep(2);
    }
    elsif ($selection eq "Crear Directorio"){
        print "Nombre del directorio a crear: ";
        $dir = <>;
        chomp($dir);
        my $resp = mkdir $dir,0775;
        if ($resp == 1){
            print "El directorio $dir fue creado correctamente\n";
            $fecha = fecha();
            print LOG "El directorio $dir fue creado correctamente $fecha\n";
        }
        elsif ($resp == 0){
            print "El directorio $dir no fue creado correctamente\n";
            $fecha = fecha();
            print LOG "El directorio $dir no fue creado correctamente $fecha\n "
        }
        sleep(2);
    }
    elsif ($selection eq "Borrar Directorio"){
        print "Nombre del directorio a eliminar: ";
        $dir = <>;
        chomp($dir);
        my $resp = rmdir $dir;
        if ($resp == 1){
            print "El directorio $dir fue eliminado correctamente\n";
            $fecha = fecha();
            print LOG "El directorio $dir fue eliminado correctamente $fecha\n";
        }
        elsif ($resp == 0){
            print "El directorio $dir no fue eliminado correctamente\n";
            $fecha = fecha();
            print LOG "El directorio $dir no fue eliminado correctamente $fecha\n "
        }
        sleep(2);
    }
    elsif ($selection eq "Cambiar Permisos"){
        print "Nombre de los directorios o archivos a modificar ejemplo \"file1.txt,file2.txt,hola\": ";
        $dir_file = <>;
        chomp($dir_file);
        my @files = split(',', $dir_file, length($dir_file));
        for $file (@files){
            print "$file\n";
        }
        print "Escribe el permiso a colocar en formato octal ejemplo 0755: ";
        $mode = <>;
        chomp($mode);
        my $resp = chmod oct($mode),@files;
        if ($resp > 0){
            print "Los directorios o archivos $dir_file fueron modificados en sus permisos con $mode\n";
            print "$resp archivos modificados (@files)\n";
            $fecha = fecha();
            print LOG "Los directorios o archivos $dir_file fueron modificados en sus permisos con $mode $fecha\n";
            print LOG "$resp archivos modificados (@files) $fecha\n";
        }
        elsif ($resp <= 0){
            print "Los directorios o archivos $dir_file no fue modificado\n";
            $fecha = fecha();
            print LOG "Los directorios o archivos $dir_file no fue modificado $fecha\n "
        }
        sleep(2);
    }
    else{
        print "Eleccion incorrecta"
    }
    close(LOG)
}

