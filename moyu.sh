echo "Welcome to 摸鱼.sh"
echo "You can create a JUNK file in a specified size, which looks just like a normal file"
echo "This shell scrip is great for you to deal with an irresponsible professor"
echo "-----------------------------------------------------------"
echo "Please input a file name: "
read file_name
echo "Please specify file size (KB): "
read file_size
cat /dev/urandom | head -c ${file_size}K > ${file_name}
echo "Well done! File generation succeeded"
