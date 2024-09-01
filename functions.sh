#!/bin/bash
    USERID=$( id -u )
    # echo "user id is $userid"

    if [ $USERID -ne 0 ]
    then 
        echo " It is not root user $USERID "
        exit 1 
    fi    
        dnf list installed git

    if [ $? -ne 0 ]
        then 
            echo "Git is not installed....going to install it"
                dnf install git -y
            if [ $? -ne 0 ]
            then 
                echo " Git installation is not Success....check it "
                exit 1
                else
                echo "Git installation is Success......"
            fi
            else
            echo " Git is already installed, nothing to do "
        fi

        dnf list installed mysql

        if [ $? -ne 0 ]
        then 
        echo " Mysql is not installed , going to install it"
        dnf install mysql -y

        if [$? -ne 0 ]
        then
            echo "Mysql installation is failure, Check it "
            exit 1
        else 
            echo "MySql installation is Success....."
        fi
       else
            echo " MySql is already installed, nothing to do ....."
            fi 
