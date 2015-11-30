#!/bin/bash

# since I don't have the -k argument available to keep the originals
# and I want to rename the files in place

# find the gzips
for i in $(find /path/to/dir -type f -name "*.gz"); do
  # remove the .gz from the file name
  zz=${i//.gz/}
  
  # extract and write to output file in same location without .gz extension
  gunzip -c $i > $zz
done
