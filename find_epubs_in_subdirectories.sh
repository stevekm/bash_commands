#!/bin/bash
# find all the epubs that are scattered amongst subdirs
find . -iname "*.epub" -type f -exec cp {} ./ePub_dirs/ \;
