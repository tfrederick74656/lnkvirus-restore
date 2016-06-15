use File::Copy qw(move);

opendir my $dir, $ARGV[0] or die "Cannot open directory: $!";
my @files = readdir $dir;
closedir($dir);

foreach my $shortcut (@files)
{
	if (index($shortcut, ".lnk") != -1) {
		print "$shortcut\n";
		
		open (FH, "$shortcut") || die "Can't open file $ARGV[0] for reading\n";
		binmode(FH);
		
		# Check header is 4c
		# This is actually 4 bytes long I'm only reading the first 1byte
		my $header = read_unpack(0,1);
		if ($header ne "4c") {
			print "Invalid Lnk file header\n";
			exit;
		}
		
		# Get Linked Folder
		my $guid = read_unpack_ascii(605,75);
		$guid =~ s/\000//g;
		print "$guid\n";
		
		my $newdir = substr($shortcut, 0, -4);
		
		print "$ARGV[0]$guid\n";
		print "$ARGV[0]$newdir\n";
		move "$ARGV[0]$guid", "$ARGV[0]$newdir";

		print "\n"
	}
}

sub read_unpack {
 my ($loc, $bites) = @_;
 my ($tmp_data);
  seek(FH,$loc,0) or
        die "Can't seek to $loc\n";
     read(FH,$tmp_data,$bites);
     $tmp_data = (unpack('H*', $tmp_data));
     return($tmp_data); 
}

sub read_unpack_ascii {
 my ($loc, $bites) = @_;
 my ($tmp_data);
  seek(FH,$loc,0) or
        die "Can't seek to $loc\n";
     read(FH,$tmp_data,$bites);
     $tmp_data = (unpack('A*', $tmp_data));
     return($tmp_data); 
}