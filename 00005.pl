#!/usr/bin/perl

use strict;
use warnings;

my $answer = 42;

if ($answer == 7 * 7) {
    print "everything is running fine.\n";
} else {
    warn "there must be a bug somewhere...\n";
}
