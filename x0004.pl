      sub generate_securis {
          local ($securis) = @_;
          return sub {
              print "$securis \n" ;
          }
      }
      $rs = generate_securis("securis!");
      $securis = "Warzone";
      &$rs();                                        # Prints "Goodbye", not "hello"
