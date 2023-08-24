#!/bin/bash

set -e 

# Validate the user who is running the script is a root user or not.

USER_ID=$(id -u)

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

echo -e "\e[35m Configuring frontend\e[0m \n"

echo -n "Installing Frontend :"
yum install nginx -y &>> /tmp/frontend.log
stat 0 $?

echo -n "Starting Nginx :"
systemctl enable nginx &>> /tmp/frontend.log
systemctl start nginx &>> /tmp/frontend.log
stat $?
   
echo -n "Downloading frontend component"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
stat $?

echo -n "Cleanup of Frontend :"
cd /usr/share/nginx/html
rm -rf *   &>> /tmp/frontend.log
stat $?

echo -n "Extracting Frontend :"
unzip /tmp/frontend.zip  &>> /tmp/frontend.log
stat $?

echo -n "Sorting the frontend files :"
mv frontend-main/* .  &>> /tmp/frontend.log
mv static/* .         &>> /tmp/frontend.log  
rm -rf frontend-main README.md  &>> /tmp/frontend.log
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Restarting the Frontend"
systemctl daemon-reload  &>> /tmp/frontend.log
systemctl restart nginx  &>> /tmp/frontend.log
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
