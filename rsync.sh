#!/bin/bash

# rsync {source} {target} 

rsync -avhR --progress /media/steve/disk/Music/ /media/steve/31F0895514032E83/Music/
# a =  archive mode, preserve metadata
# v =  verbose
# z = compression (don't use for local transfers)
# h = human readable 
# R = relative path names (why??)

# to/from a remote server..

rsync -avzheR --progress -e "ssh" /Users/steve/local/dir steve@server.com:/path/to/remote/dir
