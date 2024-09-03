#!/bin/bash
USERID=$( id -u )
VALIDATE(){
    if[ $1 -ne 0 ] 
        then
            echo "$2 is ....Failed"
        exit 1
        else
        echo "$2 is ....Success"
}

    if[ $USERID -ne 0]
        then 
            echo"please run this script with root privelege"

