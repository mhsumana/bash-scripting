# bash-scripting

This repository contains all the basics needed to learn BASH SCRIPTING and major goal is to automate the entire configuration management procedure involved as part of the setup

### How to push the code to git hub?
...

    $ git add .                               // This will let the git to track all the files.
    $ git commit -m "Updated the readMe file"
    $ git push                               // This will push the code to the repository on the Github
....

## How to open a folder on VScode with a command
...

    $ code folderName
...    

This is a repository created to publish all the Bash Bascis and project automation

This repo is created to share all the linux basics
Along with Linux Bash Syntax
Then we will automate the infrastructure provisioning
And then Configuration Management.
Following are the shell scripting topics which we discuss as a part of our project
1. SheBang Notation and Comments
2. Printing
3. Variables
    - Local Variables.
    - Environment Variables.
    - Command Substitution.
4. Inputs
    - Special Variables
    - Prompts
5. Functions
6. Redirectors & Quotes & Exit status 
7. Conditions
8. Loops
9. Basis of SED Command
10. Commands

### Expressions are categorized in to three
1. Numbers
2. Strings
3. Files

Operators on numbers:
-eq , -ne , -gt, -ge, -lt, -le

[ 1 -eq 1 ] 
[ 1 -ne 1 ]

Operators on Strings:


    = , == , !=

    [ abc = abc ]

    -z , -n 

    [ -z "$var" ] -> This is true if var is not having any data
    [ -n "$var" ] _> This is true if var is having any data

    -z and -n are inverse proportional options


Operators on files:
    Lot of operators are available and you can check them using man pages of bash 

    [ -f file ] -> True of file exists and file is a regular file 

    [ -d xyz ]  -> True if file exists and it is a directory

    ### Explore the file types, There are 7 types on files in Linux.


COMMENT

ACTION=$1
 
if [ -z "$ACTION" ]; then 
    echo Argument is needed, Either start/stop
    
else 
    echo Thanks

fi  -->


# In Bash Scripting, even if the instruction x-fails, it just goes with the execution of other commands in sequence.
# That's the default behavior of BASH.
# If you don't want the script to proceeding further in case of any failure, you can use "set -e" in the beginning of the script.
