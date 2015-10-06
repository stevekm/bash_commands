#!/bin/bash
# find all the large files in the dir, split into <4GB parts for FAT32 drives
find -type f -size +4000M | while read FILE; do 7z a /media/steve/disk1/files_go_here/"${FILE}.7z" -mx0 -v4000m "$FILE"; done
