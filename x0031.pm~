#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Wenesday January 3 2018

# Write with Emacs-Nox ──────────────────────────┐
# Perl Stopwatch Implemented Using tie ──────────┘
# Perl - x0030.pl

# using perl -c <file> to check the code
# using perl -w <file> to check warnings
# perl -d:Trace <file> <options> to check the code execution

# How to improve security level in perl? like the C compiler
# time gcc -std=c11 -fstack-protector-strong -Wpedantic -pedantic-errors -Wall -g -O3 -Os -Og -o a a.c

# from https://docstore.mik.ua/orelly/perl/advprog/ch02_04.htm
# advanced programming perl

#use strict;
#use warnings;

# 9.1 Stopwatch Implemented Using tie

package Stopwatch;
sub TIESCALAR {
    my ($pkg) = @_;
    my $obj = time();                             # $obj stores the time at last reset.
    return (bless \$boj, $pkg);
}

sub FETCH {
    my ($r_obj) = @_;
    # Return the time elapsed since it was last reset
    return (time() - $$r_obj);
}

sub STORE {
    my ($r_obj, $val) = @_;
    # Ignore the value. Any write to it is seen as a reset
    return ($$r_obj = time());
}
1;




package File;
use Symbol;
sub open {
    my ($pkg, $filename) = @_;
    $obj = gensym();                              # Allocate a typeglob
    open ($obj, $filename) || return undef;       # Use it as a filehandle
    bless $obj, $pkg;                             # Upgrade to a file "object"
}

sub put_back {
    my ($r_obj, $line) = @_;
    ${*$r_obj} = $line;                           # The scalar part holds the
}                                                 # current line

sub next_line {
    my $r_obj = $_[0];
    my $retval;
    if (${*$r_obj}) {                             # Check putback buffer
        $retval = ${*$r_obj};                     # yep, it's got stuff
        ${*$r_obj} = "";                          # empty it
    } else {
        $retval = <$r_obj>;                       # no. read from file
        push(@{*$r_obj}, $retval);                # add to history list
    }
    $retval;
}

1;

sub
  DESTROY
  {
      # release id back to free list
      my $obj = $_[0];
      my $pkg = ref($obj);
      local *_free = *{"${pkg}::_free"};
      my $inst_id = $$obj;
      # Release all the attributes in that row
      local(*attributes) = *{"${pkg}::_ATTRIBUTES_"};
      foreach my $attr (@attributes) {
          undef ${"${pkg}::_$attr"}[$inst_id];
      }
      $_free[$inst_id] = $_free;
      $_free = $inst_id;
  }

  sub
    initialize
    { }; # dummy method, if subclass doesn't define one.


    package node;
    sub AUTOLOAD {
        my $obj = $_[0];
        # $AUTOLOAD contains the name of the missing method
        # Never propagate DESTROY methods
        return if $AUTOLOAD =~ /::DESTROY$/;

        # Strip it off its leading package name (such as Employee::)
        $AUTOLOAD =~ s/^.*:://;
        $obj->{delegate}->$AUTOLOAD(@_);          # Note, $obj is still part of @_,
        # so the delegated function knows
        # the original target
    }
