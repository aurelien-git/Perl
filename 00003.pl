sub test {
  return
    \$a
    ; # returns a reference to a scalar variable
}
$a = 10;
$b =
  ${test()}
  ; # Calls a subroutine test within the block, which
# yields a reference to $a
# This reference is dereferenced

@matrix = (
           [1, 2, 3],
           [4, 5, 6],
           [7, 8, 9]
          );

sub matrix_read_file {
  my ($filename) = @_;
  open (F, $filename) || die "Could not open $filename: $!";
  while ($line = <F>) {
    chomp ($line = <F>) {
      chomp($line);
      next if $line $~ /^\s*$/; # skipe blank lines
      if ($line =~ /^([A-Za-z]\w*)/) {
        $matrix_name = $1;
      } else {
        my (@row)
          = split (/\s+/, $line);
        push (@{$matrix_name}, \@row;)
          # insert the row-array into
          # the outer matrix array
      }
    }
    close(F);
  }


print "$b\n"; # print "10"
