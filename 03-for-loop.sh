#!/bin/bash
USERID=$(id -u)


CHECK_ROOT(){
if [ $USERID -ne 0 ]
then 
    echo " Please run this script with root previleges...."
fi
}

CHECK_ROOT
for package in $@ # install any packege 
do 
dnf install $package
    if [ $? -ne 0 ]
    then 
        echo " The $package is not installed, going to install it...."
        dnf install $package -y
        if [ $1 -ne 0 ]
        then 
            echo " The $2 installed is Failuere...."
            else
            echo " The $2 installations Success...."
        fi
        else
        echo " The $package is already installed..."
    fi
done
