#!/bin/bash
USERID=$(id -u)
#echo "$USERID"
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
  VALIDATE $? "Installing mysql...."

  systemctl enable mysqld  &>>LOGFILE
  VALIDATE $? "enabling mysql..."

  systemctl start mysqld  &>>LOGFILE
  VALIDATE $? "starting mysql..."
  # mysql_secure_installation --set-root-pass ExpenseApp@1  &>>LOGFILE
  # VALIDATE $? "setting up mysql root Passward"

  #Below code will be useful for idempotent nature
mysql -h 172.31.42.136 -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
    VALIDATE $? "MySQL Root password Setup..."
else
    echo -e "MySQL Root password is already setup...$Y SKIPPING $N"
fi