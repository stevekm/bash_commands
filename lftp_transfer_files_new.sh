#!/bin/bash
#### make sure the ftp server is set to start at phone's system root folder

lftp -e "mirror --continue --only-newer --parallel=5 --no-empty-dirs -v /storage/emulated/0/ /home/steve/Samsung_Galaxy_S4_backup/storage/emulated/0/ &
mirror --continue --only-newer --parallel=5 --no-empty-dirs --exclude Music/ --exclude .Trash-1000/ -v /storage/extSdCard/ /home/steve/Samsung_Galaxy_S4_backup/storage/extSdCard/" ftp://192.168.1.3:3721

### old vvv

lftp -e "mirror --continue --only-newer --parallel=5 --no-empty-dirs -v /storage/emulated/0/ /home/steve/Samsung_Galaxy_S4_backup/storage/emulated/0/" ftp://192.168.1.7:3721

##### Nexus 6, root at /sdcard/

# lftp -e "mirror --continue --only-newer --parallel=5 --no-empty-dirs --exclude .Trash-1000/ -v / /home/steve/Android_Backups/Nexus_6_backups/sdcard" ftp://192.168.1.2:3721

# without music dir (use this one)
lftp -e "mirror --continue --only-newer --parallel=10 --no-empty-dirs --exclude Music/ --exclude .Trash-1000/ --exclude Android/ -v / /home/steve/Android_Backups/Nexus_6_backups/sdcard" ftp://192.168.1.2:3721