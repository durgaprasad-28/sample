#!/bin/bash
NUM1=$1
NUM2=$2
NUM3=$NUM1+$NUM2
if [ $NUM3 -gt 100 ]; then
echo "the number is greater than 100"
elif [ $NUM3 -lt 100 ]; then
echo "the number is lesser than 100"
elif [ $NUM3 -eq 100 ]; then
echo "the number is equal to 100"
else  
echo "the number is not equal to 100"
fi