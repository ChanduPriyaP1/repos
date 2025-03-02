#!/bin/bash
USERID=$(id -u)
#echo "$USERID"
TIMESTAMP=$(date +%F-%H:%M:%S)
SCRIPT_NAME=$(echo "$0" | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
# LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
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

  dnf install mysql-server -y &>>LOGFILE
  VALIDATE $? "Installing mysql"
  systemctl enable mysqld  &>>LOGFILE
  VALIDATE $? "enabling mysql"
  systemctl start mysqld  &>>LOGFILE
  VALIDATE $? "starting mysql"
  mysql_secure_installation --set-root-pass ExpenseApp@1  &>>LOGFILE
  VALIDATE $? "setting up mysql root Passward"