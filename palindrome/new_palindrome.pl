#!/usr/bin/perl

use strict;
use warnings;
use Array::Compare;
use Data::Dumper;

my $input_file = $ARGV[0];

pallindrome($input_file);

sub pallindrome {
	my ($file) = @_;

	my $comp = Array::Compare->new;

	open(FH,"<$file") or die "cannot read $file\n";

	while ( my $line = <FH> ){
		chomp($line);

		my $temp = $line;

		# lower case the line
		$line = lc($line);

		# remove special characters
		$line =~ s/(\W)//g;

		my @pallindrome_array = split(" ",$line);

		if( (scalar(@pallindrome_array)) != 1) {
			$line = join('',@pallindrome_array);
		}

		my @singleword_pallindrome_array = split("",$line);
		my @singleword_reverse_pallindrome_array = reverse(@singleword_pallindrome_array);


		if ($comp->compare(\@singleword_pallindrome_array, \@singleword_reverse_pallindrome_array)) {
   			print "$temp - Pallindrome \n";
 		} else {
 			print "$temp - Not a Pallindrome\n";
  		}
	}
	close(FH);
}