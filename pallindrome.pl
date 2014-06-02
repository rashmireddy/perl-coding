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

	open(FH,"<$file");

	while ( my $line = <FH> ){
		chomp($line);

		my $temp = $line;

		$line = lc($line);
		$line =~ s/(\W)//g;

		my @pallindrome_array = split(" ",$line);
		my @reverse_pallindrome_array = reverse(reverse(@pallindrome_array));

		

		if( (scalar(@pallindrome_array) == 1) && (scalar(@reverse_pallindrome_array) == 1) ){
			my @singleword_pallindrome_array = split("",$line);
			my @singleword_reverse_pallindrome_array = reverse(@singleword_pallindrome_array);


			if ($comp->compare(\@singleword_pallindrome_array, \@singleword_reverse_pallindrome_array)) {
   				print "$temp - Pallindrome \n";
 			} else {
  				print "$temp - Not a Pallindrome\n";
  			}

		} else {
			if ($comp->compare(\@pallindrome_array, \@reverse_pallindrome_array)) {
   				print "$temp - Pallindrome \n";
 			} else {
  				print "$temp - Not a Pallindrome\n";
  			}
  		}
	}
	close(FH);
}