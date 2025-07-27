#!/bin/bash

number=$1

echo "enter number "
number = read -s

if [$number -lt 10]
then
    echo "Given $number is less than 10"
else 
echo "Given $number is not less than 10"
fi

