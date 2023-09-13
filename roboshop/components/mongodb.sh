#!/bin/bash

set -e 

# Validate the user who is running the script is a root user or not.

USER_ID=$(id -u)
COMPONENT=mongodb
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

echo -n "Configuring the ${COMPONENT} repo: "
curl -s -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $?

echo -n "Installing ${COMPONENT} :"
yum install -y ${COMPONENT}-org &>> ${LOGFILE}
stat $?

echo -n "Enabling the ${COMPONENT} visibility: "
sed -ie 's/127.0.0.0/0.0.0.0/g' /etc/mongod.conf
stat $?

echo -n "Starting the ${COMPONENT} service: "
systemctl enable mongod
systemctl start mongod
stat $?

echo -n "Downloading the ${COMPONENT} schema: "
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

echo -n "Extracting the ${COMPONENT} schema: "
cd /tmp
unzip -o ${COMPONENT}.zip &>> ${LOGFILE}
stat $?

echo -n "Injecting the ${COMPONENT} schema: "
cd ${COMPONENT}-main
mongo < catalogue.js &>> ${LOGFILE}
mongo < users.js     &>> ${LOGFILE}
stat $?

<<COMMENT
1. Install Mongo & Start Service.
# yum install -y mongodb-org
# systemctl enable mongod
# systemctl start mongod

1. Update Listen IP address from 127.0.0.1 to 0.0.0.0 in the config file, so that MongoDB can be accessed by other services.
Config file:   `# vim /etc/mongod.conf`

# systemctl restart mongod

Download the schema and inject it.
# curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"

# cd /tmp
# unzip mongodb.zip
# cd mongodb-main
# mongo < catalogue.js
# mongo < users.js
COMMENT