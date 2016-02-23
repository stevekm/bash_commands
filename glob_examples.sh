#!/bin/bash

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

# set up the output directory
OUT_DIR="/some/dir"
mkdir -p $OUT_DIR

# set the input directory
Directory="/some/other/dir"

# Glob for some bigWig files
# load the file paths into an array object
BIG_WIGS=($Directory/**/*.bw) 

# iterate over the array object; [@] = all objects, can also call by index number
for i in "${BIG_WIGS[@]}"; do
 # get the sample name from its dir name
  q=$(basename $(dirname "$i" ) )
 # strip out things we don't need in the name
  z=${q/*./}
 # copy the file with new name (don't overwrite if already present!, preserve metadata, verbose copy)
  cp -avn "$i" "$OUT_DIR"/"$z".bw
done


# glob the PCA files we want
FILES=($Directory/**/@(report.raw.pdf|report.qnorm.pdf|report.mnorm.pdf|labels.tsv|report.mnorm.pdf) )

for i in "${FILES[@]}"; do
  # flatten the filepath to make the filename
  # # strip 'pca.standard/' from the name, replace all '/' with '_'
  TMP_NAME=$(echo ${i#*pca.standard/} | tr / _ )
  cp -avn $i $OUT_DIR/$TMP_NAME
done


#~~~ Shell Options ~~~~#
# unset globs if it wasn't originally set
((extglob_set)) && shopt -u extglob
((nullglob_set)) && shopt -u nullglob
((globstar_set)) && shopt -u globstar

# set outdir permissions to allow read/write access to group members
chmod g+rw -R $OUT_DIR*
# also consider 'umask 007' next time..
