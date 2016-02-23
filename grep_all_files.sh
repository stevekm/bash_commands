#!/bin/bash
# Search all my mardown files for a name, or an email address 

grep -F Name_to_find *.md

# can also use -l to just return the file name

# find someone's email address

grep -F -e @ *.md | grep name_to_find
