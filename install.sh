#!/bin/bash
    USERID=$( id -u )
    # echo "user id is $userid"

    if [ $USERID -ne 0 ]
    then 
        echo " It is not root user $USERID "
        exit 1 
    else
fi    
    dnf list installed git

    if [ $? -ne 0 ]
        then 
            echo "Git is not installed....going to install git"
                dnf install git -y
            else
            echo " Git is already installed "
            fi
