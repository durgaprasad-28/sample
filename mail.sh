#!/bin/bash
TO_ADDRESS=$1
SUBJECT=$2
team_name=$3
alert=$4
ip_address=$5
message=$6
EMAIL_BODY=$(sed -e "s/team_name/$3/g" -e "s/alert/$4/g" -e "s/ip_address/$5/g" -e "s/$messagey/$body/g" disk.html )
body=$(echo $message | sed -e "s/'/'\\\\''/g)
{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$EMAIL_BODY"
} | msmtp "$TO_ADDRESS"