#!/bin/bash

DATE=$(date +%F)
echo "Todays date is $DATE "

SESSIONS_COUNT=$(who | wc -l)
echo "Total number of open sessions is $SESSIONS_COUNT "

# To print the date is color
echo -e "\e[33m Todays date is $DATE \e[0m"