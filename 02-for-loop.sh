#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
        echo " Please run this scrip with root previlege... $USERID"
        exit 1
fi

        dnf list installed git
if [ $? -ne 0 ]
then 
        echo " Git is not installed, going to install"
        dnf install git -y

            if [ $1 -ne 0 ]
            then 
                echo "Git installation Failure"
                exit 1
            else
                echo "Git install is Success"
            fi
        else
            echo "Git is already installed, nothing to do...."
fi

        dnf list insalled mysql
if [ $? -ne 0 ]
then 
        echo "Mysql is not installed, going to install"
        dnf install mysql -y

            if [ $1 -ne 0 ]
            then 
                echo " Mysql installation is failure"
            else
                echo " Mysql installation is success"
            fi
        else
            echo " Mysql is already installed, nothing to do ...."
fi           
