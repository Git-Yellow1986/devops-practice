#!/bin/bash
USERID=$(id -u)
R="\e[31m "
G="\e[31m "
N="\e[0m "

VALIDATE() {

        if [ $1 -ne 0 ]
        then 
            echo -e "$2 is .... $R FAILED $N"
            exit 1
            else
            echo -e "$2 is ....$G SUCCESS $N"
        fi
}

CHECK_ROOT(){

    if [ $USERID -ne 0 ]
    then 
        echo "Please run this script with root previlege....."
        exit 1
    fi
}

CHECK_ROOT

for package in $@
do 
        dnf list installed $package
            if [ $? -ne 0]
                echo "$package is not intalled, going to install it"
                    dnf install $package -y

                        VALIDATE $? "Installing $package"
                        else
                                
                     echo "$package is already installed, nothing to do ....."
            fi
done