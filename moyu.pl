#!/usr/bin/perl

$manual = <<"EOF";
Welcome to 摸鱼.pl
  You can create a JUNK file in a specified size, which looks just like a normal file
  This shell script is great for you to deal with an irresponsible professor
Before using, you are suggested to:
  chmod u+x moyu.pl
Usage:
  ./moyu.pl FILE_PATH FILE_SIZE
  Example: The command 'moyu cs101-lab1.docx 20' will generate 'cs101-lab1.docx' sized 20KiB
Have fun!
EOF

sub create_file {
    if (-e @_[0]) {
        print("Error: The file already exists\n");
    } elsif (@_[1] !~ /^\+?[1-9][0-9]*$/) {
        print("Error: Please specify a correct file size\n");
    } else {
        system("dd if=/dev/urandom of=$ARGV[0] bs=1K count=$ARGV[1]");
        return 0;
    }
    return 1;
}

if ($#ARGV == -1) {
    print($manual);
} elsif ($#ARGV == 1) {
    $create_file_return = create_file($ARGV[0], $ARGV[1]);
    if ($create_file_return == 0) {
        exit 0;
    }
} else {
    print("Error: No such usage\n");
}

print("Run this perl script with no argument for help\n");
exit 1;
