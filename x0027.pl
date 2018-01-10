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

  sub
    _define_accessor
    {
        my ($pkg, $attr) = @_;

        my $code = qq{
        package $pkg;
        sub $attr {                                    # Accessor ...
        \@_ > 1 ? \$_${attr} \{\${\$_[0]}] = \$_[1]    # set
          : \$_${attr} \[\${\$_[0]}];                  # get
            }
            if (!defined \$_free) {
        # Alias the first attribute column to _free
          \*_free = \*_$attr;
        \$_free = 0;
        };
        };
        $code;
    }

    sub
      _define_constructor
      {
          my $pkg = shift;
          my $code = qq{
          package $pkg;
          sub new {
          my \$class = shift;
          my \$inst_id;
          if (defined(\$_free[\$_free])) {
          \$inst_id = \$_free;
          \$_free = \$_free[\$inst_id];
          } else {
          \$inst_id = \$_free++;
          }
            my \$obj = bless \\\$inst_id, \$class;
          \$obj->set_attributes(\@_) if \@_;
          \$obj->initialize;
          \$obj;
          }
          };
          $code;
      }

      sub
        get_attribute_names
        {
            my $pkg = shift;
            $pkg = ref($pkg) if ref($pkg);
            my @result = @{"${pkg}::_ATTRIBUTES_"};
            if (@{"${pkg}::ISA"}) {
                foreach my $base_pkg (@{"${pkg}::ISA"}) {
                    push (@result, get_attribute_names($base_pkg));
                }
            }
            @result;
        }

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

          # # @attrs = $obj->get_attributes (qw(name age));
          # sub
          # get_attributes
          # {
          #     my $obj = shift;
          #     my (@retval);
          #     map $obj->${_}(), @_;
          # }

          # sub
          #   set_attribute
          #   {
          #       my ($obj, $attr_name, $attr_value) = @_;
          #       my ($pkg) = ref($obj);
          #       ${"${pkg}::_$attr_name"}[$$obj] = $attr_value;
          #   }

          #   sub
          #     get_attribute
          #     {
          #         my ($obj, $attr_name, $attr_value) = @_;
          #         my ($pkg) = ref($obj);
          #         return ${"${pkg}::_$attr_name"}[$$obj];
          #     }
