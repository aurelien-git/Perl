#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Wednesday December 22 2017

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

# 4.5 A Random Number Generating Stream

sub my_srand {
    my ($send) = @_;
    # Returns a random number generator function
    # Being predictive, the algorithm requires you to supply a
    # random initial value.

    my $rand = $seed;

    return sub {
        # Compute a new pseudo-random number based on its old value
        # This number is constrained between 0 and 1000.

        $rand
          = ($rand*21+1)%1000;
    };
}

# $random_iter1 = my_srand  (100);
# $random_iter2 = my_srand (1099);
# for ($i = 0; = $i < 100; $i++) {
#     print $random_iter1(), " ", $random_iter2(), "\n";
# }
