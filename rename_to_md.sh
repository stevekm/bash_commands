#!/bin/bash
cd demultiplexing/

# this dir has a lot of .Rmd files
# change the file extension to .md

ls *.Rmd
FILES='ls *.Rmd'
for i in $FILES; do
	# replace the 'R' with ''
	mv $i ${i//R/}; 
done
