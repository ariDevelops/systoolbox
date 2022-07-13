#!/usr/bin/perl 
use warnings;
use strict;
use diagnostics;
use autodie;
use Term::ANSIColor;
use Cwd;
use Tk;
#Avaiable colors for Term's lib => black  red  green  yellow  blue  magenta  cyan  white

#search for wht system you are using
open(my $in, "uname -ov|");
my $sys = <$in>;

$sys = "Ubuntu" if $sys =~ /\b([#]\d{2}[-])?[Uu]buntu\b/;
$sys = "Debian" if $sys =~ /\b([#]\d{2}[-])?[Dd]ebian\b/;
$sys = "Arch-linux" if $sys =~ /\b([#]\d{2}[-])?[Aa]rch[-._]?[Ll]inux\b/;
$sys = "Fedora" if $sys =~ /\b([#]\d{2}[-])?([Ff]edora)\b/;


print color("yellow"),"sys is: ", color("reset"), "$sys \n";

if ($sys =~ /([Dd]ebian|[Uu]buntu)/) {
my $run = system("sudo apt-install git");

}elsif($sys eq "Arch-linux") {
	my $run = system("sudo pacman -S git");
}elsif($sys eq "Fedora") {
	my $run = system("sudo yum intall git");
}

