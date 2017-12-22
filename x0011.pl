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

# 5.2.1.1 Execption.pm
use Test::Exception;
package AmountExceededException;                  # user-defined exception
@ISA = ('Exception');

package OverdraftException;                       # user-defined exception
@ISA = ('Exception');

package BankAccount;
sub withdraw_money {
    my $amount = shift;
    if ($amount > $balance) {
        throw new OverdraftException;
    }
    ...                                           # Change balance
}

try {
    print "How much do you need?"; chomp($amount = <STDIN>);
    withdraw_money ($amount);
}
  catch AmountExceededException =>
  sub {print 'Cannot withdraw more than $300'},
  OverdraftException            =>
  sub {print $_[0]-> message},
  Default =>
  sub {print "Internal error. Try later"};
