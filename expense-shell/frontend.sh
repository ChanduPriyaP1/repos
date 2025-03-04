#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H:%M:%S)
SCRIPT_NAME=$(echo "$0" | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
cyan="\e[36m"
G="\e[32m"
Y="\e[33m"
m="\e[35m" # meganta
lr="\e[91m" # Lightred
BY="\e[43m" # Background Yellow
N="\e[0m"

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

  dnf install nginx -y &>>$LOGFILE
  VALIDATE $? "Installing Nginx......."

  systemctl enable nginx &>>$LOGFILE
  VALIDATE $? "Enable Nginx....."

  systemctl start nginx &>>$LOGFILE
  VALIDATE $? "Starting Nginx...."

  rm -rf /usr/share/nginx/html/* &>>$LOGFILE
  VALIDATE $? "Remove Old Nginx...."


  curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOGFILE
  VALIDATE $? "Download frontend Application...."

  cd /usr/share/nginx/html

  unzip /tmp/frontend.zip &>>$LOGFILE
  VALIDATE $? "Unzip frontend Application"

  cp /home/ec2-user/repos/expense-shell/expense.conf /etc/nginx/default.d/expense.conf &>>$LOGFILE
  VALIDATE $? "Coping Files...."

  systemctl restart nginx &>>$LOGFILE
  VALIDATE $? "frontend Application Restart"