#!/bin/bash

# This Script Has Full Of Errors
set -e

handling()
{
    echo "Error Occured At Line No:$1, Error Command:$2 "
}

trap 'handling ${LINENO} "$BASH_COMMAND"' ERR

# set -e

# failure(){
#     echo "Failed at $1: $2"
# }

# trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

red="\e[31m"
g="\e[32m" # Green
y="\e[33m" # Yellow
n="\e[0m"

echo -e "$red Before calling colors..$n"

./1-colors.sh
# Here I wantedly write wrong word for testing set and trap command.
echhggo -e "..............$g using $./ $n................."

echo "$lb iam chandu After calling $m COLORS $N script...$N"

source ./1-colors.sh
echo -e ".................$lb using SOURCE $N................."

echo -e "$lb iam chandu After calling $m COLORS $N script...$N"