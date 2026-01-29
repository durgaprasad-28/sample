#!/bin/bash
TIME=$(date +%s)
echo " the total time is $TIME"
sleep 10
TOTALTIME=$(date +%s))
FINALTIME=$(($TOTALTIME-$TIME))
echo "the time is $FINALTIME"
