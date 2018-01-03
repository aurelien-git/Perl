#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Wenesday January 3 2018

# Write with Emacs-Nox ──────────────────────────┐
# Perl The Need for Inheritance ─────────────────┘
# Perl - x0022.pl

# using perl -c <file> to check the code
# using perl -w <file> to check warnings
# perl -d:Trace <file> <options> to check the code execution

# How to improve security level in perl? like the C compiler
# time gcc -std=c11 -fstack-protector-strong -Wpedantic -pedantic-errors -Wall -g -O3 -Os -Og -o a a.c

# from https://docstore.mik.ua/orelly/perl/advprog/ch02_04.htm
# advanced programming perl

#use strict;
#use warnings;



package Route;                                    # Base class

sub allocate {
    my ($pkg, $trace, $route, $starting_position) = @_;
    my $r_route = bless {
                         "trace"      => $trace,
                         "route"      => $route,
                         "position"   => $starting_position
                        }
      , $pkg;
    return $r_route;
}

sub ping {
    my $r_route                       = shift;
    my $current_position              = $r_route->{"position"};
    my $next_position                 = lookup_next_position($current_position);
    $r_route->{"position"}            = $next_position;
}

package TraceRoute;
@ISA = ("Route");                                 # Inheriths from Route

sub new {
    my ($pkg, $trace, $route, $starting_position,
        $hourly_rate, $overtime_rate) = @_;
                                                  # Let the route package create and bless the object
    my $r_route =
      $pkg->allocate
      ($trace, $route,
       $starting_position);
    $r_route->{"hourly_rate"}   = $hourly_rate;
    $r_route->{"overtime_rate"} = $overtime_rate;
    return $r_route;                              # return the object reference
}
sub compute_ytd_income {
#    ....
}
