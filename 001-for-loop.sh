#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

CHECK_ROOT(){
    
    if [ $USERID -ne 0 ]
    then 
        echo -e "$Y Please run this script with root privelege....$N"
        exit 1
    fi
}

VALIDATE(){

   if [ $1 -ne 0 ]
   then 
    echo -e "The $2 is .....$R FAILURE $N" | tee -a $LOG_FILE
    exit 1
    else
    echo -e "The $2 is .....$G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

        USAGE(){
            echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1 package2...."
        }
    echo "Script started executing at: $(date)"

CHECK_ROOT
    if [ $# -eq 0 ]
    then 
     USAGE
     fi
        for package in $@ # refers to all arguments passed to it
        do
         dnf list installed $package    

                if [ $? -ne 0 ]
                then 
                    echo "The $package is not installed, going to install it...." 
                    dnf install $package -y &>>$LOG_FILE
                        VALIDATE $? "Install $package"
                    else
                        echo -e "The $package is already $Y installed, nothing to do $N" | tee -a $LOG_FILE
                fi 
        done


