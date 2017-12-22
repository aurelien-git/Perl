    # 4.3 An even number stream generator
    sub even_number_printer_gen {
        # This function returns a reference to an anon. subroutine.
        # This anon. subroutine prints even numbers starting from înput.

        my($input)
          = @_;
        if ($input % 2) { $input++}               # Next even number, if the given
                                                  # number is odd
        $rs = sub
          {
              print "
$input
";                                                # Using $input,which is a variable
                                                  # declared in an outside scope
  $input
  ";                                            # declared in an outside scope

$input
+= 2;
};
return $rs;                                       # Return a reference to the subroutine above
}
