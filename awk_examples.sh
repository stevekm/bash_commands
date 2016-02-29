
# print the entire .csv file, first column only
awk -F '","'  'BEGIN {OFS=","} { print $1 }' file.csv

# print the line that contains the pattern
awk '/somepattern/' file

# print the lines from the .csv file that contain the match in column 7; SOX10 and IGF1R are patterns to match
awk -F, '$7 ~ /SOX10|IGF1R/' file.csv

# count and print matched pattern
awk '/SOX10/{++cnt} END {print "Count = ", cnt}' file.csv

# print the matching lines
awk '/SOX10/ {print $0}' file.csv

# print the filename
awk 'END {print FILENAME}' file.csv
