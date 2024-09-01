#!/bin/bash
USERID=$(id -u)


if [$USERID -ne 0]
then 
        echo " Please run this scrip with root previlege..."
        exit 1
fi

        dnf list installed git
if [ $? -ne 0]
then 
        echo " Git is not installed, going to install"
        dnf install git -y

            if [ $? -ne 0]
            then 
                echo "Git installation is not Success"
                exit 1
            else
                echo "Git installatation is Success"
            fi
        else
            echo "Git is already installed, nothing to do...."
fi

        dnf list insalled mysql
if [ $? -ne 0 ]
then 
        echo "Mysql is not installed, going to install"
        dnf install mysql -y

            if [ $? -ne 0 ]
            then 
                echo " Mysql installation is failure"
            else
                echo " Mysql installation is success"
            if
        else
            echo " Mysql is already installed, nothing to do ...."
fi           
