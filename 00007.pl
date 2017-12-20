#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Wednesday December 13 2017

# Write with Emacs-Nox ──────────────────────────┐
# Perl - x0001.pl ───────────────────────────────┘

# using perl -c <file> to check the code
# perl -d:Trace <file> <options> to check the code execution

# to improve security level use pedantic option:
# time gcc -std=c11 -fstack-protector-strong -Wpedantic -pedantic-errors -Wall -g -O3 -Os -Og -o a a.c


my (%profs);                            # prof_read_file() populates this data structure from file

sub
  prof_read_file
  {
      my ($filename) = @_;
      my ($line, $curr_prof);
      open (F, $filename) || die "Could not open $filename";
      while ($line = <F>) {
          chomp($line);
          next if $line =~ /^\s*$/;     # skip blank lines
          if ($line =~ /^id.*:\s*(.*)/) {
              # Use an anonymous hash to store a professor's data
              $profs{$1} = $curr_prof = {};
          } elsif ($line =~ /^Office Hours.*:\s*(.*)/) {
              # $1 contains a string like 'Mon 2-2, Tue 4-6'
              $curr_prof->{Office Hours} = interval_parse($1);
          } elsif ($line =~ /^Courses.*:\s*(.*)/) {
              # $1 contains something like 'HS201, MA101'
              my (@courses_taught) = split(/[\s,]+/, $1);
              $curr_prof->{courses} = \@courses_taught;
          }
      }
  }
