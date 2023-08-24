#!/bin/bash

# There are 4 types of command available : 

# 1) Binary                   ( /bin  , /sbin ) - (commd type cat, type yum will give the path and they are bin path)
# 2) Aliases                  ( Alises are shortcuts,  alias net="netstat -tulpn" )
# 3) Shell Built-in Commands  (commands which comes up as part of Shell eg. type cd, type echo, type break)
# 4) Functions                # Functions are nothing but a set of command that can be written in a sequence and can be called n number of times as per your choice.

# How to declare a function?
# This is how we can decalre a function
# f() {
#    echo Hi
# }
# This is how we call a function
# f

# sample() {
#    echo hi from sample function
#    echo sample function is completed
# }
# sample

# echo sample call is completed

# sample

Hi() {
    echo "I am Hi function"
    echo "I am here to say Hi"
    echo "I am completed"
}

stat() {
    echo "Number of sessions opened is $(who| wc -l)"
    echo "Todays date is $(date +%F)"
    echo "Avg CPU Utilization in last 5 minutes $(uptime | awk -F : '{print $NF}' | awk -F , '{print $2}')"

# calling another function Hi
    Hi
}
stat



