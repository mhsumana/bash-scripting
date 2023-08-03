#!/bin/bash

DATE=$(date +%F)
echo "Todays date is $DATE "

SESSIONS_COUNT=$(who | wc -l)
echo "Total number od open sessions id $SESSIONS_COUNT "