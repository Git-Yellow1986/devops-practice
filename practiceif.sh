#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo " Please run this script with root previlege...."
    exit 1
else
    echo " Script is running"
fi