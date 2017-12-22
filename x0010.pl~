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

# 5.0

# Slurp the entire file
while ($line = <>) {
    $str .= $line;                      # Accumulate the entire file.
}

# $str now contains the entire file. Execute it !
eval $str;

# put some code inside $str

$str = '$c = $a + $b';                  # Perl doesn't care what's inside $str
$a = 10; $b = 20;
eval $str;                              # Treat $str as code, and execute it.
print "$c\n";                               # prints 30

# 5.2 The Block Form: Exception Handling
eval {
    $a = 10; $b = 0;
    $c = $a / $b;                       # Cause a run-time error,
    # Which is trapped by eval
};

print $@;                               # Prints "Illegal division by 0 at try.pl line 3

# 5.2 Exception Handling
sub open_file {
    open (F, $_[0]) ||
      die "Could not open file: $!"
      ;
}

$f = 'test.dat';
while (1) {
    eval {
        open_file($f);
        # if open_file dies, the program doesn't quit
    };
    last unless $@;                     # no error: break out of the loop.
    print "$f is not present. Please enter new file name $f";
    chomp($f = <STDIN>);
}

# 5.2 Exception Handling
eval {
    ...
};
if ($@ =~ /sorry, bucko/) {
} else {
    # hmm .. don't know what to do with it.
    die;                                # Identical to die $@
}
