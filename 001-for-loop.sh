#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
N="\e[0m"


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
    echo -e "The $2 is .....$R FAILURE $N" | tee -a $LOG_FILE
    else
    echo -e "The $2 is .....$G SUCCESS $N"  | tee -a $LOG_FILE
    fi
}
    echo "Script started executing at: $(date)"
CHECK_ROOT
    
        for package in $@ # refers to all arguments passed to it
        do
         dnf list installed $package | tee -a $LOG_FILE

                if [ $? -ne 0 ]
                then 
                    echo "The $package is not installed, going to install it...." | tee -a $LOG_FILE
                    dnf install $package -y | tee -a $LOG_FILE
                        VALIDATE $? "Install $package"
                    else
                        echo "The $package is already installed, nothing to do"
                fi 
        done


