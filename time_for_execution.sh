#!/bin/bash
# record the time needed to execute a command
# iterate over numeric range
for i in {32..1}; do
  start_time=$(date +%s)
  echo -ne "$i\t" && echo run time is $(expr $(date +%s) - $start_time) s
done
