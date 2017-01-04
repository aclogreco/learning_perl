#!/usr/bin/perl -w
#
# read-string-02.04.pl
# Learning Perl
#    by Randal Schwartz
# Chapter 2, Exercise 4
#
# Anthony C. LoGreco


print "Enter a string: ";
$string = <STDIN>;
chomp ($string);
print "Enter a number: ";
$number = <STDIN>;
chomp ($number);

print "$string\n" x $number;
