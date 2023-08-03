#!/bin/bash

DATE=$(date +%F)
echo "Todays date is $DATE "

SESSIONS_COUNT=$(who | wc -l)
echo "Total number of open sessions is $SESSIONS_COUNT "