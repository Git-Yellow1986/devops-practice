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
done
