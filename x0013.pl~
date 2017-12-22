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

# 6.1 Basic Package

package BankAccount;

$total = 0;
sub deposit {
    my ($amount)= @_;
    $total += $amount;
    print "You now have $total dollars \n";
}

sub withdraw {
    my ($amount)= @_;
    $total -= $amount;
    $total = 0 if $total < 0;
    print "You now have $total dollars \n";
}


# 6.1.2 Symbolic References
package A;
$x = 10;

package B;
# Access $A::x symbolically
print ${"A::x"};

# or even more indirectly
$pkg      = "A";
$var_name = "X";
print ${"${pkg}::$var_name"};

# Call a subroutine indirectly
#&{"A::foo"}(10, 20);                    # Identicl to A::foo(10,20);
