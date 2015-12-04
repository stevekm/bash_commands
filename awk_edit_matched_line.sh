#!/bin/bash

# search for line in file containing '92m', replace with '31m'
awk '/92m/{gsub(/92m/, "31m")};{print}' ~/file > ~/file.new

# file will get overwritten unless cat'd to new file, watch out
