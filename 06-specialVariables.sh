#!/bin/bash

# Special variables gives special properties to your variables

# Here are few of the special variables: $0 to $9, $?, $#, $*, $@

echo $0                            # $0 prints the script name you're executing
echo "Executed Script Name is: $0"

# ROCKET_NAME=Chandrayaan
# bash scriptName.sh  arg1  arg2  arg3

echo "Name of recently launched rocket is $1"
echo "Popular EV vehicle in States is $2"
echo "current Topic is $3"