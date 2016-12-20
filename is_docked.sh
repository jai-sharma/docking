#!/bin/bash

## Script require on argument
# Path to existing regular file
# Script will exit well given file is deleted
# This script is to be used as the the target program for systemd-inhibit

if [ -z "$1" ]
then
	echo "Please provide a single argument as path to docking file"
	echo "Misuse of is_docked.sh"
	exit 0
fi

DOCKFILE=$1

while true
do
	if [ -e $DOCKFILE ]
	then
		sleep 1
	else
		exit 0
	fi
done
