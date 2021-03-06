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



# set_attributes
#   {
#       my $obj = shift;
#       my $attr_name;
#       if (ref($_[0])) {
#           my ($attr_name_list, $attr_value_list) = @_;
#           my $i = 0;
#           foreach $attr_name (@$attr_name_list) {
#               $obj->$attr_name($attr_value_list->[$i++]);
#           }
#       } else {
#           my ($attr_name, $attr_value);
#           while (@_) {
#               $attr_name = shift;
#               $attr_value = shift;
#               $obj->$attr_name($attr_value);
#           }
#       }
#   }

#   # @attrs = $obj->get_attributes (qw(name age));
#   sub
#   get_attributes
#   {
#       my $obj = shift;
#       my (@retval);
#       map $obj->${_}(), @_;
#   }

# sub
#   set_attribute
#   {
#       my ($obj, $attr_name, $attr_value) = @_;
#       my ($pkg) = ref($obj);
#       ${"${pkg}::_$attr_name"}[$$obj] = $attr_value;
#   }

# sub
#   get_attribute
#   {
#       my ($obj, $attr_name, $attr_value) = @_;
#       my ($pkg) = ref($obj);
#       return ${"${pkg}::_$attr_name"}[$$obj];
#   }
