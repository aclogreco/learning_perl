#!/usr/bin/perl
%words = qw(
    fred       camel 
    barney     llama 
    betty      alpaca
    wilma      alpaca
);
print "What is your name? ";
$name = <STDIN>;
chomp $name;
if ($name =~ /^anthony\b/i) {
    print "Hello, Anthony! How good of you to be here!\n";
} else {
    print "Hello, $name!\n";
    print "What is the secret word? ";
    $guess = <STDIN>;
    chomp ($guess);
    while (! good_word($name,$guess)) {
	print "Wrong, try again. What is the secret word? ";
	$guess = <STDIN>;
	chomp ($guess);
    }
}

sub good_word {
    my($somename,$someguess) = @_;
    $somename =~ s/\W.*//;
    $somename =~ tr/A-Z/a-z/;
    if ($somename eq "anthony") {
	return 1;
    } elsif (($words{$somename} || "groucho") eq $someguess) {
	return 1;
    } else {
	return 0;
    }
}
