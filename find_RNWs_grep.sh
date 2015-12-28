FILES=$(find /Users/kellys04 -type f -name "*.Rnw" 2> /dev/null)

# this is the pattern I want to find within the files
PATTERN='which('

for i in $FILES; do 

# if the file contains the search string, print the file name
if [[ -n $(grep -F $PATTERN $i) ]] ; then

# grep; -F fixed pattern, -l ouput file name of matches
# [[ -n ]]; test (see man test), -n nonzero string length
# grep searches file for our pattern 
# and outputs filenames if found
# [[ -n ]] tests to see if this output is nonzero length

# on a successful search, grep will print the file name
grep -Fl $PATTERN $i
# or echo $i
grep -F $PATTERN $i
fi ;
done