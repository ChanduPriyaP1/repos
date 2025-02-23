#!/bin/bash


echo " Enter UserName :" # We call Variables using '$' symbol.
read Username # Here UserName is Variable

echo " Enter Passward : " # Here we can Saw Passward. I wanna hide Passward.
read Passward # Here Passward is Variable

echo " Enter UserName1 :" # Now hide the Username
read  -s Username1 

echo " Enter Passward1 : " # Now hide the Passward
read -s Passward1 

echo "UserName : $Username1"
echo "Passward : $Passward1" 