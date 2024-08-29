#!/bin/bash

echo "Enter you name :: "
read USERNAME
echo "USERNAME entered is : $USERNAME"

FRUITS=("APPLE" "GRAPS" "SUGARCRANE" "ORANG") # ARRAY
echo "First fruit is : ${FRUITS[2]}"
echo "Second fruit is : ${FRUITS[0]}"
echo "All fruits are : ${FRUITS[@]}"