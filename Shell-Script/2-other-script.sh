#!/bin/bash

echo -e "$R Before calling colors..$N"

./1-colors.sh
# fun 
echo -e "................$G using ./ $N......................."

echo -e "$lb iam chandu After calling $m COLORS $N script...$N"
echo "Scrip Name $0"
echo "PID Is: $$"

source ./1-colors.sh

echo -e "....................$lb using SOURCE $N................"
fun # function calling
echo -e "$m iam chandu After calling $R COLORS $N script...$N"
echo -e "Scrip Name $G$0$N"
echo -e "PID Is: $G$$$N"