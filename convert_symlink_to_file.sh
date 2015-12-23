#!/bin/bash
# http://stackoverflow.com/a/26298571/5359531
for f in $(find -type l);do cp --remove-destination $(readlink $f) $f;done;
