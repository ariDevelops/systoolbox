#!/usr/bin/perl 
use warnings;
use strict;
use diagnostics;
use autodie;
use Term::ANSIColor;
use Cwd;
#11/07/22 at 00:15 pm
#interface for automate and handle the proccess of gitconfig file
#by ariel vieira 

open(my $WHOGIT, "which git|");		#open child process to search for git 
my $havegit = <$WHOGIT>;


#if true, set the envirnonment in case you didnt this before
if($havegit =~ m|([/]\w[/])* ([/]git\b){1}|ix) {	
	print "you already have ",color("yellow"),"$& ",color("reset");
	print "at path dir: ",color("bright_blue"), "$' $`\n\n",color("reset");
	print "configure git?\t",color("bright_red"), "(PERFORM THIS ONLY IF NOT ALREADY CONFIGURED!)\n",color("reset");
	print "(y/n)?  ";chomp(my $answer = <STDIN>);
	if($answer =~ m![Yy]es\b|([Yy]es)*!) { &runconfig(); }

}else{  #if false asks for the installation proccess
	print color("bright_red"), 
	"ALERT\ncannot find git\nyou could run manually via #! %sudo apt-get install git (customized installation)\n
	#! or even automating via this program (default installation)\n",color("reset");
	print "let the program install git now (y/n) ? ";chomp(my $answ = <STDIN>);
	if ($answ =~ m!\b[Yy]es\b|\b([Yy]es)*!) { &runinstall(); }
	
}



#functions for installation and configuration
#connfig function
sub runconfig { 

#setup your name for git
print color("bright_yellow"), "Enter your name for git: ",color("reset"); chomp(my $name = <STDIN>);
my $confname = system("git config --global user.name \"$name\"");

print color("bright_yellow"), "Email address: ",color("reset"); chomp(my $mail = <STDIN>);
my $confmail = system("git config --global user.email $mail");

}


#install function
sub runinstall {


}
