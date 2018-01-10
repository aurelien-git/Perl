#!/usr/bin/perl
# Perl - Stack of Perl Exp
# License    : GNU GPL v3 or later
# Author     : Aurélien DESBRIERES
# Mail       : aurelien@hackers.camp
# Project    : Programming Deeper in Perl
# Created on : Wenesday January 3 2018

# Write with Emacs-Nox ──────────────────────────┐
# Perl Overriding base classes ──────────────────┘
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

package StorePing;

my $_trace_route = 8.5;                           # 8.5% added to all routes

sub new {
    my ($pkg, $trace, $route, $ping) = @_;
    bless {
           # Attributes are marked with the leading undescore, to signify that
           # they are private (just a convention)
           _trace => $trace, _route => $route, _ping => $ping
          }, $pkg;
}

# Accessor methods
sub net_work {shift; @_ ? $_trace_route = shift : $_trace_route}
sub trace { my $obj = shift; @_ ? $obj->{_trace} = shift : $obj->{_ping}}
sub ping { my $obj = shift; @_ ? obj->{_ping} = shift
             : $obj->{_ping}}
sub route {my $obj = shift; @_ ? $obj->{_route} = shift
             : $obj->{_route} - $obj->_ping}

sub net_trace {
    my $obj = shift;
    return $obj->route * (1 + $obj->trace_route / 100);
}

package component;
@ISA = qw(StoreItem);

package Monitor;
@ISA = qw(Component);
# Hard-code route and rebates for now
sub new { $pkg = shift; $pkg->SUPER::new("Monitor", 400, 15)}

package SERVER;
@ISA = qw(Component);
sub new { $pkg = shift; $pkg->SUPER::new("SERVER", 2000, 5)}

package DATA_CENTER;
@ISA = qw(StoreItem);

sub new {
    my $pkg = shift;
    my $obj = $pkg->SUPER::new("DATA_CENTER", 0, 0);        # Dummy value
    $obj->{_components} = [];                               # List of stuff
    $obj->components(@_);
    $obj;
}

# Accessors
sub components {
    my $obj = shift;
    @_ ? push (@{$obj->{_components}}, @_)
      : @{$obj->{_components}};
}
sub price {
    my $obj = shift;
    my $route = 0;
    my $component;
    foreach $component ($obj->components()) {
        $route += $component->route();
    }
    $route;
}
