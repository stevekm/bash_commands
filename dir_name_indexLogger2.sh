#!/bin/bash
# set the proper permissions for all files created by this script
# Generate a log based on directory names, and enter values from each directory into the log's entries

umask 007 
# make sure that the log file exists
LOG=/path/to/log.tsv
touch $LOG

# find the list of directory names to enter into the log, they all start with a 1
FILES=$(find /path/to/dirs/1* -maxdepth 0 -type d)
for i in $FILES; do

	# find the number of items in each run, based on the number dirs with names that start with L
	LANES=$(find $i/subdir -maxdepth 1 -name 'L*' | wc -l);

	# find a certain value within an Parameters.xml file that each dir will contain 
	# in the .xml, it is formatted like this:
	# <DesiredValue>6</DesiredValue>
	EXPNAME=$(grep DesiredValue $i/Parameters.xml | cut -f 2 -d '>' | cut -f 1 -d '<');

	# concatenate the output into the log in TSV format
	# need -e to make the \t work right
	echo -e "$(basename $i)\t$LANES\t$EXPNAME">> $LOG;
done

# use sort unique to remove the duplicate entries
# because the entire list is being appended repeatedly
sort -u $LOG -o $LOG

# output the log to console
cat $LOG
