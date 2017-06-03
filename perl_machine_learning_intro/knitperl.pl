#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use Path::Tiny;

my $filename = shift;

my @lines = path($filename)->lines;

my $in_execute_block = 0;
my @block;
my @output_lines;
for my $line (@lines) {
    if ($line =~ /^```execute_perl/) {
        $in_execute_block = 1;
        next;
    } 
    if ($in_execute_block) {
        if ($line =~ /^```$/) {
            $in_execute_block = 0;
            push @output_lines, ProcessBlock(\@block);
            @block = ();
        } else {
            push @block, $line;
        }
    } else {
        push @output_lines, $line;
    }
}

path($filename . ".out")->spew(@output_lines);

sub ProcessBlock {
    my ($block) = @_;
    
    my $perl_script = $block->[0];
    chomp($perl_script);
    
    system("perl " . $perl_script); 
      
    return (
        "```perl\n",
        grep {$_ !~ /HTML::Show/ && $_ !~ /^use / && $_ !~ /^#!/ && $_ !~ /^no warnin/} path($perl_script)->lines(),
        "```\n",
        "___\n", 
        '<iframe style="border:none;width: 100%;height: 800px;" src="' . $perl_script . ".html\"></iframe>\n"); 
}
