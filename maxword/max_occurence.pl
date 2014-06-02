#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $input_file = $ARGV[0];

if(-e $input_file) {
	max_occurence($input_file);
} else {
    print STDERR "$input_file not found\n";
}

#while (($key, $value) = each(%$result->{'$VAR1'})) {
#	print "Word $key occurs $value times\n";
#}


sub max_occurence {
	my ($file) = @_;
	

	open(FH,"<$file") or die "Coldn't open file $!\n";

	my %words;

	while (my $line = <FH>) {
		chomp($line);

		my @temp_arrray = split(" ",$line);

		foreach my $i (@temp_arrray) {
			# trim leading and trailing spaces
			$i=~s/^\s+//g;
			$i=~s/\s+$//g;

			$i = lc($i);

			if(exists $words{$i}) {
				$words{$i}++;
			}
			else {
				$words{$i}=1;
			}
		}
	}

	close(FH);
	
	my $max_occurence = 0;
	my $max_word=undef;

	foreach my $w (keys %words) {
		if($words{$w} > $max_occurence) {
			$max_word = $w;
			$max_occurence = $words{$w};
		}
	}

	print "The word \"$max_word\"" . " occurs " . $words{$max_word}. " times\n";
}

