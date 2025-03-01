#!/bin/bash

 SCRIPT_NAME=$(echo "$0" | cut -d "." -f1)
R="\e[31m"
cyan="\e[36m"
G="\e[32m"
Y="\e[33m"
BY="\e[43m"
N="\e[0m"
functions()
{
    return $(($1+$2))
}
functions 2 10 // function Call
 echo "sum: $?"
echo -e "$cyan**********SumOfTwoNum***********************$N"
 functions()
{
    no1=$1
    no2=$2
    a=$((no1+no2)) 
}

functions 2 10 // Function Call
 echo -e "$Y sum: $a $N"  

functions 3 6 // Function Call
 echo -e "$R sum: $a $N"
 functions 7 3 // Function Call
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
   echo -e "$cyan*************$R ScriptName $cyan********************$N"
  echo $SCRIPT_NAME
   # if we run this Script "./functions.sh" we will get uotput ./functions.sh 
   # so we execute this Script using "sh functions.sh"
