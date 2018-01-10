#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Wenesday January 3 2018

# Write with Emacs-Nox ──────────────────────────┐
# Perl Object Template Implementation ───────────┘
# Perl - x0026.pl

# using perl -c <file> to check the code
# using perl -w <file> to check warnings
# perl -d:Trace <file> <options> to check the code execution

# How to improve security level in perl? like the C compiler
# time gcc -std=c11 -fstack-protector-strong -Wpedantic -pedantic-errors -Wall -g -O3 -Os -Og -o a a.c

# from https://docstore.mik.ua/orelly/perl/advprog/ch02_04.htm
# advanced programming perl

#use strict;
#use warnings;

package ObjectTemplate;
require Exporter;
@ObjectTemplate::ISA = qw(Exporter);
@ObjectTemplate::EXPORT = qw(attributes);

my $debugging = 0;                      # Assign 1 to it to see code generated on the fly

# Create accessor methods, and new()
sub
  attributes
  {
      my ($pkg) = caller;
      @{"${pkg}::_ATTRIBUTES_"} = @_;
      my $code = "";
      foreach my $attr (get_attribute_names($pkg)) {
          # If a field name is "color", create a global array in the
          # calling package called @color
          @{"$pkg}::_$attr"} = ();

          # Define accessor only if it is not already present
          unless ($pkg->can("$attr")) {
              $code .= _define_accessor ($pkg, $attr);
          }
      }
      $code .= _define_constructor($pkg);
      eval $code;
      if ($@) {
          die "ERROR defining constructor and attributes for '$pkg':"
            . "\nt$@\n"
            . "------------------------------------------------------"
            . $code;
      }
  }
