#!/usr/bin/perl -w
#
# circumference-02.02.pl
# Learning Perl
#    by Randal L. Schwartz
# Chapter 2, Exercise 2
#
# Anthony C. LoGreco

$PI = 3.141592654;

print "\nEnter the radius of the circle: ";
$radius = <STDIN>;
chomp ($radius);

$circumference = 2 * $PI * $radius;

print "\nThe circumference of the circle with a radius of $radius is $circumference\n\n";
