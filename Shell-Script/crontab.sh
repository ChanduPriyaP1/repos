#!/bin/bash

# Deleting old logs
source ./1-colors.sh

SOURCE_DIRECTORY=/tmp/app-log

if[ -d $SOURCE_DIRECTORY ]
then
    echo -e "$m Source Directory is Exists$N"
else
    echo -e "$G please make sure $SOURCE_DIRECTORY exist$N"  
    exit 1  
 fi   
 FILE=(find $SOURCE_DIRECTORY -name "*.log" -mtime +30) 
 while IFS=read -r line
 do 
    echo -e "$Y Deliting Files: $line $N"
    rm -rf $line
 done <<<FILE
 