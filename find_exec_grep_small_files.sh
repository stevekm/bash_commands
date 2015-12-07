#/bin/bash
# search all small files for a search string
# in this case, search them all for 'xtable'

find ~/projects/ -type f -size -500k -exec grep -l xtable {} \;

# some file somewhere has some xtable code; 
# find all the files that I have ever used xtable in, return file names
