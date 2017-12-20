#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Wednesday December 13 2017

# Write with Emacs-Nox ──────────────────────────┐
# Perl - x0001.pl ───────────────────────────────┘

# using perl -c <file> to check the code
# perl -d:Trace <file> <options> to check the code execution

# How to improve security level in perl? like the C compiler
# time gcc -std=c11 -fstack-protector-strong -Wpedantic -pedantic-errors -Wall -g -O3 -Os -Og -o a a.c

sub matrix_multiply {
    my ($r_mat1, $r_mat2) = @_;         # Taking matrics by reference
    my ($r_product);                    # Returing product by reference
    my ($r1, $c1) = matrix_count_row_cols ($r_mat1);
    my ($r2, $c2) = matrix_count_row_cols ($r_mat2);
    die "Matrix 1 has $c1 columns and matrix 2 has $r2 rows."
      . "Cannot multiply\n" unless ($c1 == $r2);
    for ($i = 0; $i < $r1; $i++) {
        for ($j = 0; $j < $c2; $j++) {
            $sum = 0;
            for ($k = 0; $k < $c1; $k++) {
                $sum +=
$r_mat1->[$i][$k]
    * $r_mat2->[$k][$j];
            }
            $r_product->[$i][$j] = $sum;
        }
    }
    $r_product;
}

sub matrix_count_row_cols {         # return number of rows and columns
    my ($r_mat) = @_;
    my $num_rows =
      @$r_mat
      ;
    my $num_cols =
      @{$r_mat->[0]}
      ;                             # Assume all rows have an equal no.
    # of columns.
    ($num_rows, $num_cols);

}

sub
  prof_read_file
  {
      my ($filename) = @_;
      my ($line, $curr_prof);
      open (F, $filename) || die "Could not open $filename";
      while ($line = <F>) {
          chomp($line);
          next if $line =~ /^\s*$/;           # skip blank lines
          if ($line =~ /^id.*:\s*(.*)/) {
              # Use an anonymous hash to store a professor's data
              $profs{$1} = $curr_prof = {};
          } elsif ($line =~ /^Office Hours.*:\s*(.*)/) {
              # $1 contains a string like 'Mon 2-3, Tue 4-6'
              $curr_prof->{Office Hours} = interval_parse($1);
          } elsif ($line =~ /^Courses.*:\s*(.*)/) {
              # $1 contains something like 'HS201, MA101'
              my (@courses_taught) = split(/[\s,]+/, $1);
              $curr_prof->{Courses} = \@courses_taught;
          }
      }
  }
