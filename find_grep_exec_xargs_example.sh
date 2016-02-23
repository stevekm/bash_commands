#!/bin/bash

# find all the shell scripts I have written that use the [ ] test function
# the [ needs to be escaped!

# using xargs
find ~/projects/ -type f -name "*.sh" -print0 | xargs -0 grep -l '\['

# using exec
find ~/projects/ -type f -name "*.sh" -exec grep -l '\[' {} \;
