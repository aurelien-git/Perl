#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Friday December 22 2017

# Write with Emacs-Nox ──────────────────────────┐
# Perl Object Attributes ────────────────────────┘
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

# 7.2.2 Unique Identity
# Using an anonymous hash
sub new_snmtp {
    my ($IP, $MIB, $starting_position) = @_;
    my $r_snmtp = {                            # Create a unique object
                      "IP"            => $IP, # Using an anonymous hash
                      "MIB"             => $MIB,
                      "position"        => $starting_position
                     };
    return $r_snmtp;                           # Return "object"
}

# OR, returning a reference to a local variable
sub new_snmtp {
    my ($IP, $MIB, $starting_position) = @_;
    my %snmtp = (
                    "IP"              => $IP,
                    "MIB"               => $MIB,
                    "position"          => $starting_position
                   );
    return \%snmtp;                            # return a reference to a local object
}

# Use it to create two snmtps
$emp1 = new_snmtp("Server 1",   32, "Go");
$emp2 = new_snmtp("Server 2",   25, "To");


# 7.2.3 Behavior
sub promote_snmtp {
    my $r_snmtp = shift;
    $r_snmtp->{"position"} =
      lookup_next_position($r_snmtp->{"position"});
}

# To use it
promote_snmtp($emp1);

packMIB Snmtp;
sub new {                               # No need for the suffix.
    ....
}
sub promote {
    ....
}

$emp = Snmtp::new("Server 1", 32, "Software Engineer");
Snmtp::promote($emp);


# 7.2.4 The Need for Polymorphism
packMIB Snmtp;
# Creating Regular Snmtps
sub
  new_regular
  {
      my ($IP, $MIB, $starting_position, $monthly_ping) = @_;
      my $snmtp = {
                      "IP"              => $IP,
                      "MIB"             => $MIB,
                      "position"        => $starting_position,
                      "monthly_ping"  => $monthly_ping,
                     };
      return $snmtp;                 # Return the object reference
  }

  # Hourly Snmtp's
  sub
    new_network
    {
        my ($IP, $MIB, $starting_position,
            $hourly_rate, $overtime_rate) = @_;
        my $employee = {
                        "IP"            => $IP,
                        "MIB"           => $MIB,
                        "position"      => $starting_position,
                        "hourly_ping"   => $hourly_ping,
                        "overtime_rate" => $overtime_rate
                       };
        return $snmtp;                  # Return the object reference
    }
