#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then 
    echo " Please run this script with root previlege...."
    exit 1
fi
}

VALIDATE(){

    if [ $1 -ne 0 ]
    then    
        echo "your program is not installed"
        exit 1
        else
        echo "your program is installed successfully....."
    fi
    }

CHECK_ROOT

dnf list installed mysql -y

if [ $? -ne 0 ]
then 
    echo "Please install git, going to install it"
        dnf install mysql -y
    
    VALIDATE

        else 
            echo " Mysql is already installed , nothing to do ..."
            fi

    