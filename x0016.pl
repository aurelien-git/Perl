#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Friday December 22 2017

# Write with Emacs-Nox ──────────────────────────┐
# Dumping All Symbol in a Package ───────────────┘
# Perl - x0016.pl

# using perl -c <file> to check the code
# using perl -w <file> to check warnings
# perl -d:Trace <file> <options> to check the code execution

# How to improve security level in perl? like the C compiler
# time gcc -std=c11 -fstack-protector-strong -Wpedantic -pedantic-errors -Wall -g -O3 -Os -Og -o a a.c

# from https://docstore.mik.ua/orelly/perl/advprog/ch02_04.htm
# advanced programming perl

#use strict;
#use warnings;

# 6.8 Dumping All Symbols in a Package
package DUMPVAR;
sub dumpvar {
    my ($packageName) = @_;
    local (*alias);                     # a local typeglob
    # We want to get access to the stash corresponding to the package
    # name
    *stash = *{"${packageName}::"};     # Now %stash is the symbol table
    $, = " ";                           # Output separator for print
    # Iterate through the symbol table, which contains glob values
    # indexed by symbol names.
    while (($varName, $globValue) = each %stash) {
        print "$varName ============================== \n";
        *alias = globvalue;
        if ($alias) {
            print "\t \$$varName $alias \n";
        }
        if (@alias) {
            print "\t \%$varName ",@alias," \n";
        }
        if (%alias) {
            print "\t \%varName ",%alias, " \n";
        }

        # The use of defined is deprecated!

        # if (defined ($alias)) {
        #     print "\t \$$varName $alias \n";
        # }
        # if (defined (@alias)) {
        #     print "\t \%$varName ",@alias," \n";
        # }
        # if (defined (%alias)) {
        #     print "\t \%varName ",%alias, " \n";
        # }
    }
}


# 7.2.1 Attributes
# Use an hash table to store Employee attributes
%employee = ("name"      => "John Doe",
             "age"       => 32,
             "position " => "Software Engineer");
print "Name: ", $employee[$name_field];

# Or use an array
$name_field = 0; $age_field = 1; $position_field = 2;
@employee = ("John Doe", 32, "Software Engineer");
print "Name: ", $employee[$name_field];
