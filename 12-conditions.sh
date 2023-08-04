#!/bin/bash

# Conditions helps us to execute something only if some factor is true and if that factor is false then that something wont be executed. 

# Syntax of CASE
# case $var in
#     opt1) commands-x ;;
#     opt2) commands-y ;;
# esac

ACTION=$1 

case $ACTION in
    start)
       echo "Starting payment service"
       ;;
    stop)
       echo "Stopping payment service"
       ;;
    restart) 
       echo "Restart payment service"
       ;;
esac


