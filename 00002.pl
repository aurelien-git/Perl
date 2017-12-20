@array1 = (1, 2, 3); @array2 = (4, 5, 6, 7);
AddArrays (\@array1, \@array2); # Passing the arrays by reference.
print "@array1 \n";
sub AddArrays
  {
    my ($rarray1, $rarray2; # Length of array2
        for ($i = 0 ; $i < $len2 ; $i++) {
          $array1-
            >
            [$i] += $rarray2-
            >
            [$i];
        }
      }
