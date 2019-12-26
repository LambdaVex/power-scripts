#!/usr/bin/perl -w

# A script that changes a file name by stripping it from the ID which looks something like this '-dbIwxl1HJsw'
# Author: Ali Denno

my @files = <*>;
foreach my $file (@files) {
  my $regex = qr/(-)(?!.*\1).+(?=.mp3)/mp;
  my $originalname = $file;
  if ( ! -d $file ) {
    if ( $file =~ /$regex/g ) {
      $file =~ s/${^MATCH}//ig;
      rename "$originalname", "$file" or die "Cannot rename file: $originalname!";
    }
  }
}