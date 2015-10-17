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

# I was getting errors trying to copy my screen shots folder to a USB drive, so I wanted to remove some characters from the names of the files.

# I ran this

find -name "*" -type f | rename 's/__-_/./g'

# It deleted all my files instead

# :(

# but I did figure out how to paste all the filenames in a directory into a text document

for f in *; do echo "$f" >> this_damned_test.txt; done


# Also whats wrong with this loop?


LOGFILE="/var/log/apt/history.log.*"
for i in $LOGFILE; do zless /var/log/apt/"$i" | grep "\ install\ ">>/home/steve/Desktop/installed_aptget.txt; done

# trying to output all my installed packages to a text file