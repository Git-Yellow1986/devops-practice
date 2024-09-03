#!/bin/bash
    USERID=$( id -u )
    # echo "user id is $userid"

    if [ $USERID -ne 0 ]
    then 
        echo " It is not root user $USERID "
        exit 1 
    else
        echo "Now start install MySql"
    
    dnf install mysql -y
    dnf list installed
fi
