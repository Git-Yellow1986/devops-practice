#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $? -ne 0 ]
    then 
    echo \e "$R Please run this script with root privelage $N" | tee -a $LOG_FILE
    fi
    }

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is.... $R Failure $N" | tee -a $LOG_FILE
    else
        echo -e "$2 is ....$G SUCCESS $N" | tee -a $LOG_FILE
    fi
    }

    USAGE(){
        echo -e "$R USAGE: $N sudo sh 05-redirecctors.sh package1 package2 ....."
    }
    CHECK_ROOT
        if [ $# -eq 0 ]
        then 
            USAGE
        fi

    for package in $@ # $@ refers to all arguments passed to it 
    do 
        dnf list installed $package | tee -a $LOG_FILE
            if [ $? -ne 0 ]
            then 
                echo "$package is not installed, goint ot install it " | tee -a $LOG_FILE
                dnf install $package -y | tee -a $LOG_FILE
                
                VALIDATE $? "Installing Package"
            else
                echo "$package is already installed, nothing to do...." | tee -a $LOG_FILE
            fi
            done


        