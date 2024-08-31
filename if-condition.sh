#!/bin/bash
NUMBER=$1 # it deos not give space when assign the veriable

    if [ $NUMBER -gt 20 ]
        then 
             echo "given number: $NUMBER is greater than 20"
        else 
             echo "The given number : $NUMBER is less than 20"
        fi