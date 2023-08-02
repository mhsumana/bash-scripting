#!/bin/bash   

# What is a variable ???? It's generally used to hold some values dynamically.

# This is how we declare variables and here `a` `b` `c` are variables which holds 10 20 xyz values respectively
a=10                # a is a integer
b=20                # b is also an integer 
c=xyz               # c is a string 
DATE="02AUG2023"    # HardCoding

# There is no concept of data types in linux or shellScripting.
# By default. every thing is a string.

# If you input or variables are having some special characters, enclose them always in double quotes

# How can I print the value of the variable ?
# Using special characters, we are going to print the value of the variables.

# $ : Special Character is used to print the value of the variable 
# echo $a 

echo  a
echo  "Printing the value of a : $a"     # $a   and    ${a} : both are same. Prefer to use in flower brackets
echo  "Print the value of a : ${a}"

echo "Printing the value of x : $x" 