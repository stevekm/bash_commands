#!/bin/bash

# find files of a certain type that are in subdirectories

find . -type f -name "*.fastq.gz" -exec cp {} ./2015-10-14/ \;
