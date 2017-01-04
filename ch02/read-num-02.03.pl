#!/usr/bin/perl -w
#
# read-num-02.03.pl
# Learning Perl
#    by Randal L. Schwartz
# Chapter 2, Exercise 3
#
# Anthony C. LoGreco

print "\nEnter a number: ";
$num1 = <STDIN>;
chomp ($num1);
print "Enter another number: ";
$num2 = <STDIN>;
chomp ($num2);

$result = $num1 * $num2;

print "$num1 times $num2 equals: $result\n\n";
