#!/bin/bash
echo "* ** ** ** ** ** ** ** ** ** ** ** *"
echo " Enter First Number:"
read FNum

echo " Enter Last Number:"
read LNum

for ((FNum; FNum<=LNum; FNum++))
do 
   # echo  "$FNum" # Here it will print values in verticaly.
   echo  -n "$FNum" # Using -n it will print values in Horizontally.
done   
echo " "

echo "* ** ** ** ** ** ** ** ** ** ** ** *"

array=['su','du','cu','ku']
echo "$array"
for i in $array[0]
do 
   
   echo "*"
done

echo "* ** ** ** ** ** ** ** ** ** ** ** *"



echo "* ** ** ** ** ** ** ** ** ** ** ** *"
echo "* ** ** ** ** ** ** ** ** ** ** ** *"