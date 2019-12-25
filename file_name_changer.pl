#!/usr/bin/perl -w

# Author: Ali Denno

my @files = <*>;
foreach my $file (@files) {
  my $regex = qr/(-)(?!.*\1).+(?=.mp3)/mp;
  my $originalname = $file;
  if ( $file =~ /$regex/g ) {
	$file =~ s/${^MATCH}//ig;
	rename "$originalname", "$file" or die "Cannot rename file: $originalname!";
  }
}