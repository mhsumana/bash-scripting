#!/bin/bash

set -e 

# Validate the user who is running the script is a root user or not.

USER_ID=$(id -u)
COMPONENT=frontend
LOGFILE="/tmp/${COMPONENT}.log"

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[31m Script is expected to be executed by the root user or with a sudo privilege\e[0m \n \t Example: sudo bash wrapper.sh frontend"
    exit 1 
fi

stat() { 
    if [ $1 -eq 0 ]; then
      echo -e "\e[32m success\e[0m"
    else
      echo -e "\e[31m Failure\e[0m" 
      exit 2
    fi     
}

echo -e "\e[35m Configuring ${COMPONENT}\e[0m"
echo -n "Installing ${COMPONENT} :"
yum install nginx -y &>> ${LOGFILE}
stat $?

echo -n "Starting Nginx :"
systemctl enable nginx &>> ${LOGFILE}
systemctl start nginx &>> ${LOGFILE}
stat $?
   
echo -n "Downloading ${COMPONENT} component"
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

echo -n "Cleanup of ${COMPONENT} :"
cd /usr/share/nginx/html
rm -rf *   &>> ${LOGFILE}
stat $?

echo -n "Extracting ${COMPONENT}:"
unzip /tmp/${COMPONENT}.zip  &>> ${LOGFILE}
stat $?

echo -n "Sorting the ${COMPONENT} files :"
mv ${COMPONENT}-main/* .  &>> ${LOGFILE}
mv static/* .         &>> ${LOGFILE} 
rm -rf ${COMPONENT}-main README.md  &>> ${LOGFILE}
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Restarting the ${COMPONENT}"
systemctl daemon-reload  &>> ${LOGFILE}
systemctl restart nginx  &>> ${LOGFILE}
stat $?



<<COMMENT
# yum install nginx -y
# systemctl enable nginx
# systemctl start nginx
# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf
COMMENT
