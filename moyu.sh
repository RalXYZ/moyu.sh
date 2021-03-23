argv_0=$0
argv_1=$1
argv_2=$2
argc=$#

case $argc in
0 )
    script_name=`echo $argv_0 | sed 's/\.\///'`  # remove './' if exists
    echo "Welcome to 摸鱼.sh"
    echo "  You can create a JUNK file in a specified size, which looks just like a normal file"
    echo "  This shell script is great for you to deal with an irresponsible professor"
    echo "Before using, you are suggested to:"
    echo "  alias moyu='sh `pwd`/${script_name}'"
    echo "Usage:"
    echo "  moyu FILE_PATH FILE_SIZE"
    echo "  Example: The command 'moyu cs101-lab1.docx 20' will generate 'cs101-lab1.docx' sized 20K"
    echo "Have fun!"
    exit 0
;;
2 )
    if [ $argv_2 -gt 0 ]; then  # file size must be an unsigned integer
        dd if=/dev/urandom of=$argv_1 bs=1K count=$argv_2
        if [ -f $argv_1 ]; then  # if the file has been successfully created
            exit 0
        else
            echo "Error: Operation failed"
        fi
    else
        echo "Error: Please specify a correct file size"
    fi
;;
* )
    echo "Error: No such usage"
;;
esac

echo "Run this shell script with no argument for help"
exit 1
