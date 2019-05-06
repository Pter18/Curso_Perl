use strict;
use warnings;

my @names = ("Pedro","Alejandro","Pathy","Oscar","Diana","Abraham");
my @palabras;
my $n = $ARGV[0];
my $f = $ARGV[1];
my $path = $ENV{"HOMEPATH"};
print "$path.\\.$f";

for (my $i = 0; $i < $n; $i++) {
        my $randomvalue = @names[rand @names];
        push (@palabras,$randomvalue);
        #print $randomvalue;  
}
my $var = $path."\\".$f;
open my $fh, ">", $var;
print $fh "@palabras";
close($fh);