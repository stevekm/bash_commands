#!/bin/bash

INPUT_DIR=/path/to/dir/
OUTPUT_FILES=/path/to/output.tar.gz
OUTPUT_DIR=/path/to/

# create a tar.gz from a directory
tar -cvzf $OUTPUT_FILES $INPUT_DIR

# generate a md5sum for the tar.gz
md5sum $OUTPUT_FILES > $OUTPUT_DIR"$(basename $OUTPUT_FILES)"_md5sum.txt

# view contents of the tar.gz
tar -ztvf $OUTPUT_FILES

# exclude some things from the view output; use this to exlclude some dir paths
tar -ztvf $OUTPUT_FILES --exclude '*/*' 

# or show only certain lines of the view output
tar -ztvf $OUTPUT_FILES | grep 'pattern'

# extract the tar.gz to a directory
tar -xvzf $OUTPUT_FILES -C /path/to/the/place/where/you/want/the/output/

