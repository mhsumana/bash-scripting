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
       echo -e "\e[32m Starting payment service\e[0m"
       ;;
    stop)
       echo -e "\e[31m Stopping payment service\3[0m"
       ;;
    restart) 
       echo -e "\e[33m Restart payment service\e[0m"
       ;;
    *)
       echo -e "\e[35m Valid options are\e[0m \e[32m start\e[0m or \e[31m stop\e[0m or \e[33m restart\e[0m"
       echo -e "\e[33m Example Usage\e[0m:\n \t bash scriptName start"
       ;;
esac


