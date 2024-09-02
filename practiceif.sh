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
