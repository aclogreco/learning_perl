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
$original_name = $name;
$name =~ s/\W.*//;
$name =~ tr/A-Z/a-z/;
if ($name eq "anthony") {
    print "Hello, Anthony! How good of you to be here!\n";
} else {
    print "Hello, $original_name!\n";
    $secretword = $words{$name};
    if ($secretword eq "") {
	$secretword = "groucho";
    }
    print "What is the secret word? ";
    $guess = <STDIN>;
    chomp ($guess);
    while ($guess ne $secretword) {
	print "Wrong, try again. What is the secret word? ";
	$guess = <STDIN>;
	chomp ($guess);
    }
}
