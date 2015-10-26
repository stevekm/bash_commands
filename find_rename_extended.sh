#!/bin/bash

# find files in subdirectories
# append a + or - to the filename
# based on the presence of these characters in the original dir name

# the files are located here, in nested subdirs
cd /Users/steve/search_dir/

# make the output dir
mkdir -p /Users/steve/search_dir/output/

# find files that have + in the dir name
FILES_PLUS=$(find /Users/steve/search_dir/ -type f -path "*+-*" -name "*.fastq.gz")
for i in $FILES_PLUS; do
	echo $i
	# add the + to the end of the file name
	echo $(basename ${i/.fastq.gz/}_+.fastq.gz )
	# copy the file with the proper name to the output dir
	cp $i /Users/steve/search_dir/output/$(basename ${i/.fastq.gz/}_+.fastq.gz );
done


FILES_MINUS=$(find /Users/steve/search_dir/ -type f -path "*--*" -name "*.fastq.gz")
for i in $FILES_MINUS; do
	echo $i
	echo $(basename ${i/.fastq.gz/}_-.fastq.gz )
	cp $i /Users/steve/search_dir/output/$(basename ${i/.fastq.gz/}_-.fastq.gz );
done

