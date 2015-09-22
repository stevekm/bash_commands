#!/bin/bash
cd demultiplexing/
ls *.Rmd
FILES='ls *.Rmd'
for i in $FILES; do
	mv $i ${i//R/}; 
done
