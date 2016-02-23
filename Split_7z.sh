#!/bin/bash
# Split files >4GB into <4GB archive files for FAT32 storage devices

find -type f -size +4000M | while read FILE; do 7z a /media/user/StorageDevice/"${FILE}.7z" -mx0 -v4000m "$FILE"; done
