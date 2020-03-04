#! /usr/bin/perl

use strict;

use warnings;

use Term::ANSIColor qw(:constants);

my @before;

my @after;

 

system("rm before.txt");

system("rm after.txt");

 

print BOLD, ": Please ensure you type ':qall' in the end to exit";

 

print BOLD, RED, "paste the old file and press CTRL+D:";

@before = <STDIN>;

 

open FILE, ">before.txt" or die $!;

print FILE @before;

close FILE;

print RESET;

print "033[2J";    #clear the screen

        print "033[0;0H"; #jump to 0,0

print BOLD, YELLOW, "Please paste the new file and press CTRL+D:";

@after = <STDIN>;

open FILE, ">after.txt" or die $!;

print FILE @after;

close FILE;

print RESET;

my $status = system("vimdiff before.txt after.txt");
