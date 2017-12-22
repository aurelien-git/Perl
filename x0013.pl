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

# 6.3 Package  Initialization and Destruction
sub BEGIN {                             # can also just say BEGIN { }; the word "sub" is optional
    print "Washington was here \n";
}
foo***  ;                               # Intentional error
;
BEGIN {
    unshift (@INC, "../include");
}
use Foo;                                # Looks for Foo.pm in "../include" first

use lib qw(../include);                 # prepends the directory to @INC
