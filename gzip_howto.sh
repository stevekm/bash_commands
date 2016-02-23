#!/bin/bash
# Gzip a directory 
gzip -cvr /path/to/input/dir/ > /path/to/output.gz
# -c std out
# -r recursive through dir
# -v verbose, of course
# pipe to file you want output in 
