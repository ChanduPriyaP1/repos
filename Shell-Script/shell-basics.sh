#!/bin/bash
echo "* ** ** ** ** ** ** ** ** ** ** ** *"
a=2 # Variable Declaration
b=8 # Variable Declaration
c=$((a+b)) # $(($a+$b)) no need to mention $a and $b. 
echo "the c value is: $c" # 10
# (( )) This double Paranthesis Are used to execute Mathematics. 
# Our Shell-Script Can't underStand if we write in () single paranthesis
echo "* ** ** ** ** ** ** ** ** ** ** ** *"
((5+6)) # this command Execute but Nothing to Print Anything.
$((6+7)) # shell-basics.sh: line 9: 13: command not found.
echo "* ** ** ** ** ** ** ** ** ** ** ** *"
echo " This is multiplication: $((2*5))" # Multiplication : 10
echo " this is 2^5(2 power 5): $((2**5))" # 2 power 5 :32
echo "* ** ** ** ** ** ** ** ** ** ** ** *"
((e=6)) # We can intialize variable values here.
echo "$e" # 6
((e++)) # We can increase variable values here.
echo "$e" # 7
 d=$(echo "scale=2; 53/2" | bc)
echo $d
echo "* ** ** ** ** ** ** ** ** ** ** ** *"
#Zero After evaluation = Exit status is 1
# Non-Zero After evaluation = Exit status is 0
((1+1))
echo $?
# 0 output
((1-1))
echo $?
# 1 output
((a=6+6))
echo $?
# 0 output
echo "* ** ** ** ** ** ** ** ** ** ** ** *"
n=10
echo $n
 echo -e "An apple a day keeps\\ away \a\t\tdoctor\n"
 # \a alert (bell), it will make sound after Exicuting.
 # \t Horizontal Tab For Spece. It will give Space bitween Two words.
 # \n It will Print Next Line or new Line.
 # -e Enable interpretation of the following backslash escaped characters in the strings:
 # \a,\t,\n this are backslash escaped characters.
 # \\,\$ It will print \, $
echo "\\Slash and \$Dollar sign"
 # \Slash and $Dollar sign
 echo "Today `Date`"
 
echo "Exit Status:$?"