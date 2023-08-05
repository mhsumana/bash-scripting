#!/bin/bash


<<COMMENT
if condition is ideally available in 3 formats
    1) Simple
    2) If else 
    3) Else if

1) Simple if :

     if [expression]; 
            commands 
     fi 

     Commands are going to be executed only if the expression is true

* What will happen if the expression is false ? Then, commands wont be executed. 

2) If-Else
    
     if [expression]; then

           commnd1
     else

           comand2      
     fi


* If expression is true, then command1 will be executed. If the expression is not true, then command2 will be executed. 

3) Else if 

     if [expression1]; then

           command1

     elif [expression2]; then

           command2

     elif [expression3]; then

           command3

     else

           command4

     fi
COMMENT


# What is an expression ?? Whenever you're using Operators to perform something, that's referred as an expression.