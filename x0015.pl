#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Friday December 22 2017

# Write with Emacs-Nox ──────────────────────────┐
# An Even Number Stream Generator ───────────────┘
# Perl - x0015.pl

# using perl -c <file> to check the code
# using perl -w <file> to check warnings
# perl -d:Trace <file> <options> to check the code execution

# How to improve security level in perl? like the C compiler
# time gcc -std=c11 -fstack-protector-strong -Wpedantic -pedantic-errors -Wall -g -O3 -Os -Og -o a a.c

# from https://docstore.mik.ua/orelly/perl/advprog/ch02_04.htm
# advanced programming perl

#use strict;
#use warnings;

# 6.5 Importing Symbols
# package BankAccount;
# use Exporter;
# @ISA = ('Exporter');                    # Inherit from Exporter
# @EXPORT_OK = ('withdraw', 'deposit');

# sub deposit  { .... }
# sub withdraw { .... }

# use BankAccount ('deposit');

package Environment;
sub import {
    # Get some caller details; its package name, and the current file name
    # and line Numbermy ($caller_package) = caller;
    foreach $envt_var_name (keys %ENV) {
        *{"${caller_package}::${envt_var_name}"} = \$ENV{$envt_var_name};
    }
}
