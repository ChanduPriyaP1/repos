#!/bin/bash

a=2 # Variable Declaration
b=8 # Variable Declaration
c=$((a+b)) 
echo "the c value is: $c" # 10
# (( )) This double Paranthesis Are used to execute Mathematics. 
# Our Shell-Script Can't underStand if we write in () single paranthesis
((5+6)) # this command Execute but Nothing to Print Anything.
$((6+7)) # shell-basics.sh: line 9: 13: command not found.

echo " This is multiplication: $((2*5))"
echo " this is 2^5(2 power 5): $((2**5))"

((e=6)) # We can intialize variable values here.
echo "$e" # 6
((e++)) # We can increase variable values here.
echo "$e" # 7
 d=$(echo "scale=2; 53/2" | bc)
echo $d

#Zero After evaluation = Exit status is 1
# Non-Zero After evaluation = Exit status is 0
((1+1))
echo $?

((1-1))
echo $?

((a=6+6))
echo $?