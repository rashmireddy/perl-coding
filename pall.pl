#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $original_string = $ARGV[0];

$original_string = lc($original_string);
$original_string =~ s/^\s+//g;
$original_string =~ s/\s+$//g;

my @pallindrom_word_array = split("", $original_string);
#print Dumper(\@pallindrom_word_array);

my $i=0;
my $j=scalar(@pallindrom_word_array)-1;
my $temp=0;


while($i < $j) {
	#print "swapping " . $pallindrom_word_array[$i] . " with " . $pallindrom_word_array[$j] . "\n";
	$temp = $pallindrom_word_array[$i];
	$pallindrom_word_array[$i] = $pallindrom_word_array[$j];
	$pallindrom_word_array[$j] = $temp;
	$i++;
	$j--;
}

my $new_string = join("", @pallindrom_word_array);

if($original_string eq $new_string) {
	print "original_string : $original_string\n";
	print "new_string : $new_string\n";
	print "IT is a pallindrome \n";
} else {
	print "$original_string is NOT a pallindrome \n";
}