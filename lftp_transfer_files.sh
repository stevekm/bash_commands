#!/bin/bash
# need to install lftp, available for Linux and OS X via homebrew
# use it to transfer files from FTP server
# make an FTP server on your Android phone with ES File Manager
#### make sure the ftp server is set to start at phone's system root folder

lftp -e "mirror --continue --only-newer --parallel=5 --no-empty-dirs -v /storage/emulated/0/ /home/steve/Samsung_Galaxy_S4_backup/storage/emulated/0/ &
mirror --continue --only-newer --parallel=5 --no-empty-dirs --exclude Music/ --exclude .Trash-1000/ -v /storage/extSdCard/ /home/steve/Samsung_Galaxy_S4_backup/storage/extSdCard/" ftp://192.168.1.5:3721

### old 

lftp -e "mirror --continue --only-newer --parallel=5 --no-empty-dirs -v /storage/emulated/0/ /home/steve/Samsung_Galaxy_S4_backup/storage/emulated/0/" ftp://192.168.1.7:3721


####
# send files, to Nexus 6
lftp -e "mirror --continue --only-newer --parallel=5 --no-empty-dirs -R -v /Users/kellys04/send_to_phone/ Music" ftp://xx.xx.xx.xx:xx/

###

lftp -e "mirror -R {local dir} {remote dir}" -u {username},{password} {host}
lftp -e "mirror --dry-run --continue --only-newer --parallel=5 --no-empty-dirs -R -v /Users/USERNAME/send_to_phone/ Music" ftp://xx.xx.xx.xx:xx/
