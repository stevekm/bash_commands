#!/bin/bash

# find all files
# get basename of all files
# sort unique, remove duplicates, count the number of entries

 find . -type f -exec sh -c 'for f do basename -- "$f" ;done' sh {} + | sort -u | wc -l
