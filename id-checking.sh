#!/bin/bash
    userid=$( id -u )
    # echo "user id is $userid"

    if [ $userid -ne 0 ]
    then 
        echo " It is not root user $userid "
        exit 1
    fi

    dnf install msql -y
    
