#!/bin/bash
for i in *.rar; do mkdir -p Extracted_Data/"${i##*/}"; unrar e -ppassword "$i" -C Extracted_Data/"${i##*/}"; done
