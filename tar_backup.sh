#!bin/bash
time=`date +"%d.%m.%Y_%H.%M.%S"` 	 # grab actual date and time
file="$time.tar.gz"     			 # get filename with actual date an time

# locate source file(s) (1 - x)
source1="examplefolder1/"  
source2="file2.txt"
source3="file3.txt" 
source5="examplefolder2/"
	
target="/home/documents/backups" 		 # Destination of backup file.

# create backup
tar -czf $target/$file -C /home/documents/backups/ $source1 $source2 $source3 $source4 $source5 #$source...

# generate md5sum for latest backup and put into file named '$file.md5sum'
md5sum $target/$file >> $file.md5sum

# remove all backups older than '-mtime +x' (x day's)
find . -path "/home/documents/backups/*.tar.gz" -mtime +3 -exec rm -f {} \;
