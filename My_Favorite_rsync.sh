#!/bin/bash
# Use rsync to backup all your data from a remote server

rsync -avzheR --progress --max-size=500K -e "ssh -p 22" user@server.com:/home/user/ /home/user/ServerBackups/
# "ssh -p 22" = connect via ssh, port 22
# -a, --archive               archive mode; same as -rlptgoD (no -H)
# -v, --verbose               increase verbosity
# -z, --compress              compress file data during the transfer
# -h, --human-readable        output numbers in a human-readable format
# -e, --rsh=COMMAND           specify the remote shell to use
# -R, --relative              use relative path names
# rsync /source/ /destination/
