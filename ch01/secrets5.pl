#!/usr/bin/perl
init_words();
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
dbmopen (%last_good, "lastdb",0666);
$last_good{$name} = time;
dbmclose (%last_good);

sub init_words {
    while ( defined($filename = glob("*.secret")) ) {
	open (WORDSLIST, $filename) || die "can't open wordslist: $!";
	if (-M WORDSLIST < 7.0) {
	    while ($name = <WORDSLIST>) {
		chomp ($name);
		$word = <WORDSLIST>;
		chomp $word;
		$words{$name} = $word;
	    }
	} else {
	    rename ($filename,"$filename.old") ||
		die "can't rename $filename to $filename.old: $!";
	}
	close (WORDSLIST) || die "couldn't close wordslist: $!";
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
	open MAIL,"|mail bonsai@katrina";
	print MAIL "bad news: $somename guessed $someguess\n";
	close MAIL;
	return 0;
    }
}
