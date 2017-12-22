#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Wednesday December 13 2017

# Write with Emacs-Nox ──────────────────────────┐
# An Even Number Stream Generator ───────────────┘
# Perl - x0007.pl

# using perl -c <file> to check the code
# using perl -w <file> to check warnings
# perl -d:Trace <file> <options> to check the code execution

# How to improve security level in perl? like the C compiler
# time gcc -std=c11 -fstack-protector-strong -Wpedantic -pedantic-errors -Wall -g -O3 -Os -Og -o a a.c

# from https://docstore.mik.ua/orelly/perl/advprog/ch02_04.htm
# advanced programming perl

#use strict;
#use warnings;

# sub even_number_printer_gen {
#     # This function returns a reference to an anon. subroutine.
#     # This anon. subroutine prints even numbers startings from $input.

#     my($input)
#       = @_;
#     if ($input % 2) { $input++};        # Next even number, if the given
#                                         # number is odd
#     $rs = sub
#       {
#           print "
# $input
# ";                                      # Using $input,which is a my variable
#                                         # declared in an outside scope
#   $input += 2;
#       };
#     return $rs;                         # Return a reference to the subroutine above
# }

# We want even numbers stating from 30. Ask even_printer_gen
# for a customized iterator that can do such a thing.
# $Iterator = even_number_printer_gen(30);
# # $iterator now points to a closure.
# # Every time you call it, it prints the next successive even number.
# for ($i = 0; $i < 10; $i++) {
#     &$iterator();
# }
# print "\n";

# $iterator1 = even_number_printer_gen (102);
# $iterator2 = even_number_printer_gen (22);

# &$iterator1();                          # Print 102
# &$iterator2();                          # Print 22
# &$Iterator1();                          # Prints 104
# &$Iterator2();                          # Prints 24

# 4.4 Closures  sharing variables
sub even_odd_print_gen {
    # $last is shared between the two procedures
    my ($rs1, $rs2);
    my (
        $last
       ) = shift; # Shared by the two closures below
    $rs1 = sub { # Even number printer
        if ($last % 2) {$last ++;}
        else { $last += 2};
        print "last \n";
    };
    $rs2 = sub { # Odd number printer
        if ($last % 2) {$last += 2 }
        else { $last++};
        print "$last \n";
    };
    return ($rs1, $rs2);                # Returning two anon sub references
}

($even_iter,$odd_iter) = even_odd_print_gen(10);
&$even_iter ();                         # prints 12
&$odd_iter  ();                         # prints 13
&$odd_iter  ();                         # prints 15
&$even_iter ();                         # prints 17
&$odd_iter  ();                         # prints 17
