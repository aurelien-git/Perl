#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Wenesday January 3 2018

# Write with Emacs-Nox ──────────────────────────┐
# Perl Attribute Storage Using Arrays ───────────┘
# Perl - x0024.pl

# using perl -c <file> to check the code
# using perl -w <file> to check warnings
# perl -d:Trace <file> <options> to check the code execution

# How to improve security level in perl? like the C compiler
# time gcc -std=c11 -fstack-protector-strong -Wpedantic -pedantic-errors -Wall -g -O3 -Os -Og -o a a.c

# from https://docstore.mik.ua/orelly/perl/advprog/ch02_04.htm
# advanced programming perl

#use strict;
#use warnings;

# 8.1.1 ObjectTemplate: Attribute Storage Using Arrays

package Node;
#cpan App::ObjectTemplate;                        # Command line to install the stuff but does not exist -_-'
use ObjectTemplate;                               # Import ObjectTemplate
@ISA = qw(OjectTemplate);                         # Inherit from it.
attributes qw(trace pod position);                # Declare your attributes

use node;
$obj = node->new(
                 "trace"                => "node to node",
                 "pod"                  => "30");   # Created by ObjectTemplate
$obj->position("pod to pod");
print $obj->name, ":", $obj->pod, "\n";
