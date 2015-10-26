#!/bin/bash

cd /Users/kellys04/BaseSpace/TargetedRNAExpression-25587863
mkdir -p /Users/kellys04/BaseSpace/2015-10-14

FILES_PLUS=$(find /Users/kellys04/BaseSpace/TargetedRNAExpression-25587863 -type f -path "*+-*" -name "*.fastq.gz")
for i in $FILES_PLUS; do
	echo $i
	echo $(basename ${i/.fastq.gz/}_+.fastq.gz )
	cp $i /Users/kellys04/BaseSpace/2015-10-14/$(basename ${i/.fastq.gz/}_+.fastq.gz );
done


FILES_MINUS=$(find /Users/kellys04/BaseSpace/TargetedRNAExpression-25587863 -type f -path "*--*" -name "*.fastq.gz")
for i in $FILES_MINUS; do
	echo $i
	echo $(basename ${i/.fastq.gz/}_-.fastq.gz )
	cp $i /Users/kellys04/BaseSpace/2015-10-14/$(basename ${i/.fastq.gz/}_-.fastq.gz );
done

