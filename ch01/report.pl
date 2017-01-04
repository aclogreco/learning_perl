#!/usr/bin/perl

while ( defined($filename = glob("*.secret")) ) {
    open (WORDSLIST, $filename) || die "can't open wordslist: $!";
    if (-M WORDSLIST < 7.0) {
	while ($name = <WORDSLIST>) {
	    chomp ($name);
	    $word = <WORDSLIST>;
	    chomp $word;
	    write;
	}
    }
    close (WORDSLIST) || die "couldn't close wordslist: $!";
}


format STDOUT_TOP =
Page @<<
$%

Filename         Name       Word
================ ========== ===========
.
    
format STDOUT =
@<<<<<<<<<<<<<<< @<<<<<<<<< @<<<<<<<<<<<
$filename, $name, $word
.
