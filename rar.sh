#!/bin/bash
rar e -c- archive.rar -ppassword

# get the comment from the archive
rar cw archive.rar archive_comment.txt

# extract all .rar files in the dir, try a bunch of passwords because 
# I can't remember which passwords go to which files
FILES=*.rar
echo $FILES
for i in $FILES; do rar x $i -ppassword1 -o- -x@*.part*.rar & done 
wait
for i in $FILES; do rar x $i -ppassword2 -o- -x@*.part*.rar & done 
wait
for i in $FILES; do rar x $i -ppassword3 -o- -x@*.part*.rar & done 
wait
for i in $FILES; do rar x $i -ppassword4 -o- -x@*.part*.rar & done 
wait
for i in $FILES; do rar x $i -ppassword5 -o- -x@*.part*.rar & done 
wait
