#!/bin/bash

#To declare astatic Array
 array=("sindu" "67" "priya" "3" "Chandu" "7" "Siva")
 echo "Size of Array is : ${#array[@]}"
 echo "Count The length of a given index in the array : ${#array[2]}"
#To Print All Elements
 echo "All Elements Of Array"
 echo "${array[@]}"
 echo "${array[*]}"
#To Print The First Element
 echo "To Print First Elerment"
 echo "${array[0]}" 
#To Print a Selected index or position Element
 index=4
 echo "Selected Index Element at index $index:"
 echo "${array[$index]}" 
#To Print Elements from a particular index
 echo "${array[@]:2}" # Print Elements Starting index from 2
 echo "${array[*]:2}" # Print Elements Starting index from 2

# To Print Elements in a range
 echo "Elements in a range:"
 echo "${array[@]:1:3}" #Print elements from index 1 to 3 
 echo "${array[*]:1:3}" #Print elements from index 1 to 3
# Search in the Array
 echo "${array[@]}" | grep -w "sindu" 

 #echo "Search result for:$temp" 