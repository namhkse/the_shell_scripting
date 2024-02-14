#!/bin/sh

INPUT=0
echo -n "Enter something: "
read INPUT

if [ $INPUT -gt 0 ]; then
    echo "Input is positive"
elif [ $INPUT -lt 0 ]; then
    echo "Input is negative"
else
    echo "Input is zero"
fi