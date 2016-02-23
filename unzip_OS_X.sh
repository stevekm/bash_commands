#!/bin/bash
# unzip all files in current directory
# Unzip all .zip files in current directory into new directory of the same name. This is for OS X

# extract into new directory of the same name
for i in *.zip; do echo $i; echo ${i%.zip}; mkdir ${i%.zip}; unzip ${i} -d ${i%.zip}; done
