#!/bin/bash

# this script will move all the qsub log files from your home to a log dir
# I know there is a thing to put in the qsub script that will prevent this but not all the scripts I run are mine to modify

#~~~ Shell Options ~~~~# 
# steve's favorite shell options for globbing
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

# place to put the logs
mkdir -p ~/logs

# glob for the log files
# FILES=(~/@(*.e*|*.o*|*.pe*|*.po*) ) # this works too but less discriminate
FILES=(~/@(*.e[0-9]*|*.o[0-9]*|*.pe[0-9]*|*.po[0-9]*) ) # Use ./* ... NEVER bare *

mv "${FILES[@]}" ~/logs

# # this is a slower but more verbose and maybe safer method
# for i in "${FILES[@]}"; do 
#   if [ -e "$i" ]; then #  Check whether file exists.
#     echo "$i"
#     mv "$i" ~/logs
#   fi
# done


#~~~~~~~~~~~~~~~~~~#
# unset globs if it wasn't originally set
((extglob_set)) && shopt -u extglob
((nullglob_set)) && shopt -u nullglob
((globstar_set)) && shopt -u globstar
