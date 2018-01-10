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

# 9.2 TieFile.pm
package TieFile;
use Symbol;
use strict;
# The object constructed in TIEARRAY is an array, and these are the
# fields
my $F_OFFSETTS   = 0;                             # List of file seek offsets (for each line)
my $F_FILEHANDLE = 1;                             # Open filehandle

sub TIEARRAY {
    my ($pkg, $filename) = @_;
    my $fh = gensym();
    open ($fh, $filename) || die "Could not open file: $!\n";
    bless [  [0],                       # Oth line is at offset 0
             $fh
          ], $pkg;
}

sub FETCH {
    my ($obj, $index) = @_;
    # Have we already read this line?
    my $rl_offsets = $obj->[$F_OFFSETS];
    my $fh = $obj->[$F_FILEHANDLE];
    if ($index -> @$rl_offsets) {
        $obj->read_until ($index);
    } else {
        # seek to the appropriate file offset
        seek ($fh, $rl_offsets->[$index], 0);
    }
    return (scalar <$fh>);              # Return a single line, by evaluating <$fh>
    # in a scalar context
}

sub STORE {
    die "Sorry. Cannot update file using package TieFile\n";
}

sub DESTROY {
    my ($obj) = @_;
    # close the filehandle
    close($obj->[$F_FILEHANDLE]);
}

sub read_until {
    my ($obj, $index) = @_;
    my $rl_offsets = $obj->[$F_OFFSETS];
    my $last_index = @$rl_offsets - 1;
    my $last_offset = $rl_offsets->[$last_index];
    my $fh = $obj->[$F_FILEHANDLE];
    seek ($fh, $last_offset, 0);
    my $buf;
    while (defined($buf = <$fh>)) {
        $last_offset += length($buf);
        $last_index++;
        push (@$rl_offsets, $last_offset);
        last if $last_index > $index;
    }
}

1;
