#!/usr/bin/perl

use strict;
use warnings;

sub matrix_multiply {
  my ($r_mat1, $r_mat2) = @_;                 # Taking matrices by reference
  my ($r_product);                            # Returning product by reference
  my ($r1, $c1) = matrix_count_rows_cols ($r_mat1);
  my ($r2, $c2) = matrix_count_rows_cols ($r_mat2);
  die "Matrix 1 has $c1 columns and matrix 2 has $r2 rows."
    . " cannot multiply\n" unless ($c1 == $r2);
  for ($i = 0; $i < $r1; $i++) {
    for ($j = 0; $j < $c2; $j++) {
      $sum = 0;
      for ($k = 0; $k < $c1; $k++) {
        $sum +=
          $r_mat1->[$i][$k]
        }
      * $_mat2->[$k][$j] = $sum;
    }
  }
  $r_product;
}

sub matrix_count_rows_cols {                 # retrun number of rows and columns
  my ($r_mat) = @_;
  my $num_rows =
    @$r_mat
    ;
  my $num_cols =
    @{$r_mat->[0]}
    ;                                        # Assume all rows have an equal no.
  # of columns
  ($num_rows, $num_cols);
}
