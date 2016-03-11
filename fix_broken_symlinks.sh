#!/bin/bash

# PROBLEM: multiple subdirectories had broken symlinks
# linked files were located at the base of long file path; parent dir halfway up the path was moved
# so, the last half of the file path was still valid, but the first half of the path needed to be changed
# SOLUTION: use bash substring manipulation
# DISCLAIMER: The first set of commands were incorrect, the second set of commands fixes the errors from the first set! 


# view the broken links in the terminal
# # symlinks are in subdirs in the 'inputs/' dir
# # its known that subdirs with names that start with 'ABC' and 'XYZ' contain all broken symlinks
# # show the broken symlinks by ls'ing their dirs:
find inputs/ -type d -name "ABC*" -o -name "XYZ*" -exec ls -l {} \;

# or
# (cd inputs )
find . -type d -name "ABC*" -o -name "XYZ*" -exec ls -l {} \;

# show the fastq files in dir's with these names
find inputs/ -type f -name "*.fastq.gz" -path "*/ABC*" -o -path "*/XYZ*"


# HOW TO FIX THE SYMLINKS:
# # glob for the symlinks
# # get the current, broken link path
# # use bash substring manipulation to create a new, corrected path

# my favorite shell settings for globs:
#~~~ Shell Options ~~~~#
# use some extra shell glob features; turn them on here
# remember whether extglob was originally set, so we know whether to unset it
shopt -q extglob; extglob_set=$?
# set extglob if it wasn't originally set.
((extglob_set)) && shopt -s extglob
# Note, 0 (true) from shopt -q is "false" in a math context.

shopt -q nullglob; nullglob_set=$?
((nullglob_set)) && shopt -s nullglob

shopt -q globstar; globstar_set=$?
((globstar_set)) && shopt -s globstar

#~~~~~~~~~~~~~~~~~~#

# true location of the files, in the archives
ArchiveDir="/data/smithlab/2012-01-30/9996_SN6421_0234_B34421CXX_NYGC"

# old symlink file path that is not longer valid and needs to be changed
OldDir="/home/$(whoami)/projects/SmithLab_2016-01-04/project_notes/"

# set the dir
cd /home/$(whoami)/projects/SmithLab_2016-03-10/inputs


# glob for all the fastq.gz files in either the ABC or XYZ folders
FILES=($PWD/**/@(*ABC*|*XYZ*)/*.fastq.gz)

for i in "${FILES[@]}"; do
  # get the old path from the symlink; readlink -m works on broken links
  tmp_oldpath="$(readlink -m $i)"

  # make the new path by striping the OldDir from the path and adding the ArchiveDir path at the front
  tmp_newpath="${ArchiveDir}/${tmp_oldpath##$OldDir}"

  # print to console
  # echo -e "${tmp_oldpath}\n${tmp_newpath}\n\n\n"
  echo -e "$i"
  echo -e "${tmp_oldpath}"
  echo -e "${tmp_newpath}\n\n"

  # force the new symlink with -fs
  ln -fs "${tmp_newpath}" "$i"
done


#~~~ Shell Options ~~~~#
# unset globs if it wasn't originally set
((extglob_set)) && shopt -u extglob
((nullglob_set)) && shopt -u nullglob
((globstar_set)) && shopt -u globstar

##########################
# PROBLEM: part of the pattern was duplicated in the new file path; "9996_SN6421_0234_B34421CXX_NYGC/9996_SN6421_0234_B34421CXX_NYGC"
# example broken links; 
# /data/smithlab/2012-01-30/9996_SN6421_0234_B34421CXX_NYGC/9996_SN6421_0234_B34421CXX_NYGC/Unaligned/Project_20121121-B/Sample_lane2-8_R1.fastq.gz
# Need to repeat the process, this time replacing the doubled pattern with a single version

#~~~ Shell Options ~~~~#
# use some extra shell glob features; turn them on here
# remember whether extglob was originally set, so we know whether to unset it
shopt -q extglob; extglob_set=$?
# set extglob if it wasn't originally set.
((extglob_set)) && shopt -s extglob
# Note, 0 (true) from shopt -q is "false" in a math context.

shopt -q nullglob; nullglob_set=$?
((nullglob_set)) && shopt -s nullglob

shopt -q globstar; globstar_set=$?
((globstar_set)) && shopt -s globstar

#~~~~~~~~~~~~~~~~~~#

# do the same process as above:

BADpattern="9996_SN6421_0234_B34421CXX_NYGC/9996_SN6421_0234_B34421CXX_NYGC"
GOODpattern="9996_SN6421_0234_B34421CXX_NYGC"

# set the dir
cd /home/$(whoami)/projects/SmithLab_2016-03-10/inputs


# find all the fastq.gz files in either the ABC or XYZ folders
FILES=($PWD/**/@(*ABC*|*XYZ*)/*.fastq.gz)

for i in "${FILES[@]}"; do
  tmp_oldpath="$(readlink -m $i)"

  # this time, replace the old pattern with the new pattern
  tmp_newpath="${tmp_oldpath//$BADpattern/$GOODpattern}"
  # echo -e "${tmp_oldpath}\n${tmp_newpath}\n\n\n"
  echo -e "$i"
  echo -e "${tmp_oldpath}"
  echo -e "${tmp_newpath}\n\n"
  ln -fs "${tmp_newpath}" "$i"
done


#~~~ Shell Options ~~~~#
# unset globs if it wasn't originally set
((extglob_set)) && shopt -u extglob
((nullglob_set)) && shopt -u nullglob
((globstar_set)) && shopt -u globstar
