#!/bin/bash
# in OS X
find -E . \( ! -regex '.*/\..*' \)

# vanilla bash
find . \( ! -regex '.*/\..*' \) -type f -name "filename"
