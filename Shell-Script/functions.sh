#!/bin/bash
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
BY="\e[43m"
N="\e[0m"
echo -e "$cyan**********$m FUNCTION1 $cyan***********************$N"
functions1()
{
    return $(($1+$2))
}
functions1 2 10 // function Call
 echo "sum: $?"
echo -e "$cyan**************$m FUNCTION2 $cyan*******************$N"
 functions2()
{
    no1=$1
    no2=$2
    a=$((no1+no2)) 
}

functions2 $1 $2 // Function Call
 echo -e "$Y sum: $a $N"  

functions2 $3 $4 // Function Call
 echo -e "$R sum: $a $N"
 functions2 7 3 // Function Call
 echo -e "$R$BY sum of given numbers: $a $N"

 echo -e "$cyan*************$G PreviousStatus $cyan********************$N"
 
 if [ $? -ne 0 ]
 then
    echo -e "Existed Statement IS $R Failed.....$N"
    exit 1
else
    echo -e "Existed Statement Is $G Success.......$N"  
 fi

 echo -e "$cyan*************$R SuperUser(OR)not $cyan********************$N"
  USERID=$(id -u)
  echo "$USERID"

 if [ $USERID -eq 0 ]
 then 
   echo "You Are Super User...."
 else
   echo "You didn't Have Admin Access...You are NormalUser"  
  fi 
   echo "$cyan*************$R ScriptName $cyan********************$N" &>>$LOGFILE
  echo $SCRIPT_NAME
  echo $TIMESTAMP
  echo $LOGFILE
   # if we run this Script "./functions.sh" we will get uotput ./functions.sh 
   # so we execute this Script using "sh functions.sh"
