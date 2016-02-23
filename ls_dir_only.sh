#!/bin/bash
# Show only the directories in the ls output

ls -lF | grep /
# -F = adds '/' to the end of dirs in the list
# grep for this
# so simple!
