#!/bin/bash

set -e 

# Validate the user who is running the script is a root user or not.

USER_ID=$(id -u)
COMPONENT=catalogue
LOGFILE="/tmp/${COMPONENT}.log"
APPUSER=roboshop

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

echo -n "Configuring ${COMPONENT} repo: "
curl --silent --location https://rpm.nodesource.com/setup_16.x | bash - &>> ${LOGFILE}
stat $?

echo -n "Instaling Nodejs: "
yum install nodejs -y  &>> ${LOGFILE}
stat $?

id ${APPUSER} &>> ${LOGFILE}
if [ $? -ne 0 ] ; then
echo -n "Creating Application User: "
useradd roboshop
stat $?
fi

echo -n "Downloading the ${COMPONENT}:  "
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
stat $?

echo -n "Copying the ${COMPONENT} to ${APPUSER} home directory: " 
cd /home/${APPUSER}
rm -rf ${COMPONENT}  &>> ${LOGFILE}
unzip /tmp/${COMPONENT}.zip  &>> ${LOGFILE}
stat $?

echo -n "Changing the ownership: "
mv ${COMPONENT}-main ${COMPONENT}
chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${COMPONENT}
stat $?

echo -n "Generating the ${COMPONENT} artifacts: "
cd /home/${APPUSER}/${COMPONENT}
npm install
stat $?





<<COMMENT
$ npm install
COMMENT

