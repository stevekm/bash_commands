#!/bin/bash
# If pattern exists within files, perform action, else do nothing (or another action)

$PATTERN="MA0007.2_AR" # the gene we are interested in
cd ~/OutputDirectory/ # where your data files are stored

if [[ -n $(grep -Fl $PATTERN *.txt) ]] ; then
# grep; -F fixed pattern, -l ouput file name of matches
# [[ -n ]]; test (see man test), -n nonzero string length
# grep searches files for our pattern in all .txt files,
# and outputs filenames if found
# [[ -n ]] tests to see if this output is nonzero length

cat $(grep -Fl $PATTERN *.txt) > ~/ResultsWeWantToKeep.txt
# save the contents of the discovered file to a new file
# this allows you to append more results later in the pipeline
# perform other actions here

else
echo "The pattern we want was not found"
fi ;

# After data analysis, I had a lot of text files
# I wanted to perform further analysis, but only if  
# certain results had been returned by the first analysis

# Search each text file for a pattern (e.g. a gene name we were looking for)
# return the filenames of all files containing the pattern
# if at least one file is found
# perform some action (e.g. analysis)
