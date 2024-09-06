#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
    
    if [ $USERID -ne 0 ]
    then 
        echo "Please run this script with root privelege...."
        exit 1
    fi
}

VALIDATE(){

   if [ $? -ne 0 ]
   then 
    echo "The $2 is .....$RFAILURE$N"
    else
    echo "The $2 is .....$GSUCCESS$N"
    fi
}
    echo "Script started executing at: $(date)"
CHECK_ROOT
    
        for package in $@ 
        do
         dnf list installed $package

                if [ $? -ne 0 ]
                then 
                    echo "The $package is not installed, going to install it...."
                    dnf install $package -y
                        VALIDATE $? "Install $package"
                    else
                        echo "The $package is already installed, nothing to do"
                fi 
        done
        

