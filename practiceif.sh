#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then 
    echo " Please run this script with root previlege...."
    exit 1
fi
}

CHECK_ROOT

dnf list installed mysql -y

if [ $? -ne 0]
then 
    echo "Please install git, going to install it"
        dnf install mysql -y
        
        else 
            echo " Mysql is already installed , nothing to do ..."
            fi
            
    