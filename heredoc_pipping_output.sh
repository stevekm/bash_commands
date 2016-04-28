#!/bin/bash
# this is a bash script
echo "Hello World, this is bash"

test1=$(echo "This is a test")

echo "Here is some R code:"

Rscript --slave --no-save --no-restore - "$test1" <<EOF
  ## R code
  cat("\nHello World, this is R\n")
  args <- commandArgs(TRUE)
  bash_message<-args[1]
  cat("\nThis is a message from bash:\n")
  cat("\n",paste0(bash_message),"\n")
EOF


# $ chmod +x test.sh
# $ ./test.sh
# $ ./test.sh &>test.log
# $ cat test.log
# Hello World, this is bash
# Here is some R code:
# 
# Hello World, this is R
# 
# This is a message from bash:
# 
#  This is a test

# more info: http://www.catonmat.net/blog/bash-one-liners-explained-part-three/
