#!/bin/bash

# Each and every color you see on terminal will have a color code and we need to use that code baesd on our need.

# Colors       Foreground          Background
# Red               31                  41
# Green             32                  42
# Yellow            33                  43
# Blue              34                  44
# Magenta           35                  45
# Cyan              36                  46

# Syntax To Print Color Text Is (foreground color):
# echo -e "\e[COLORCODEm Your msg to be printed in color\e[0m"
  echo -e "\e[31m I am printing in red color\e[0m"

# # To print something with background + foreGround color , here is the syntax: 
# Ex : echo -e "\e[backgroundcode;foregroundcodem your msg\e[0m"
  echo -e "\e[43;35m printing yellow back and magenta foreground\e[0m"

  echo -e"\e[33m I am printing Yellow color\e[0m"
  echo -e "\e[32m I am printing green color\e[0m"
  echo -e "\e[34m I am printing blue color\e[0m"

  echo -e "\e[43,34m I am printing both color\e[0m"
  