#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H:%M:%S)
SCRIPT_NAME=$(echo "$0" | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

echo "Please enter DB password:"
read -s mysql_root_password

R="\e[31m"
cyan="\e[36m"
G="\e[32m"
Y="\e[33m"
m="\e[35m" # meganta
lr="\e[91m" # Lightred
BY="\e[43m" # Background Yellow
N="\e[0m"

echo -e "$cyan*************$G VALIDATE FUNCTION $cyan********************$N"
 VALIDATE()
 {
      if [ $1 -ne 0 ]
      then
        echo -e "$2$R Failed.....$N"
        exit 1
      else
        echo -e "$2$G Success.......$N"  
      fi
 }

echo -e "$cyan*************$R SuperUser(OR)not $cyan********************$N"

 if [ $USERID -eq 0 ]
 then 
   echo "You Are Super User...."
 else
   echo "You didn't Have Admin Access...You are NormalUser"  
   exit 1
  fi 
# Disbling old nodejs
dnf module disable nodejs -y &>>LOGFILE
VALIDATE $? "Nodejs Disabling is"

dnf module enable nodejs:20 -y &>>LOGFILE
VALIDATE $? "Nodejs 20:v Enabling is"

dnf install nodejs -y &>>LOGFILE
VALIDATE $? "Nodejs installing"

useradd expense

mkdir -p /app # we mention -p if the directory is created it won't create directory again and it doesn't generate error. 

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>LOGFILE
VALIDATE $? "Backend Application Downloaded"

cd /app

unzip /tmp/backend.zip &>>LOGFILE

npm install &>>LOGFILE
VALIDATE $? "npm installation"

cp  /etc/systemd/system/backend.service

systemctl daemon-reload &>>LOGFILE
VALIDATE $? "Daemon-reload"

systemctl start backend &>>LOGFILE
VALIDATE $? "Starting Backend Application"

systemctl enable backend &>>LOGFILE
VALIDATE $? "Enabling Backend Application"

dnf install mysql -y &>>LOGFILE
VALIDATE $? "installing Mysql"

mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -p${mysql_root_password} < /app/schema/backend.sql &>>LOGFILE
VALIDATE $? "Schema loading"

systemctl restart backend &>>LOGFILE
VALIDATE $? "Backend Application Restarted"