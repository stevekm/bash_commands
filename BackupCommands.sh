#!/bin/bash

# Here is what I back up before I nuke the OS, aside from pictures and music in my $HOME:

~/.bashrc
firefox bookmarks
/etc/cups/printers.conf
/etc/fstab
/etc/apt/sources.list
/etc/apache2/apache2.conf # if you are running a server
/etc/network/interfaces # ifyou are running a server
dpkg -l # tells you all installed packages and their versions. save the output


less /var/log/apt/history.log | grep Commandline>>/home/steve/Desktop/aptCommandline_get2.txt & zless /var/log/apt/history.log.*.gz | grep Commandline>>/home/steve/Desktop/aptCommandline_get2.txt




# http://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages
