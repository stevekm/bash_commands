#!/bin/bash

# count the number of slots you are using on the HPC cluster

qstat | tail -n +3 | grep -v qw | tr ' ' '\t' | cut -f31 | awk '{sum+=$1} END {print sum}'

# qstat: output cluster usage for current user (self)
# tail -n +3: remove the first 3 lines in the output  (corresponds to header information)
# grep -v qw : get all the lines that don't have 'qw' in them (waiting jobs)
# tr ' ' '\t' : change all the ' ' (spaces) to '\t' (tabs), since qstat is space-delimited
# cut -f31 : get the 31'st field, corresponds to column of slot usages
# awk '{sum+=$1} END {print sum}' : adds up all the numbers in the column
