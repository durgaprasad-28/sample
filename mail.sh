#!/bin/bash
TO_ADDRESS=$1
SUBJECT=$2
team_name=$3
alert=$4
private_ip_address=$5
message_body=$6
body=$(echo $message_body | sed -e "s/'/'\\\\''/g')
EMAIL_BODY=$(sed -e "s/team_name/$3/g" -e "s/ALERT/$4/g" -e "s/ip_address/$5/g" -e "s/message/$body/g" disk.html )
{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$EMAIL_BODY"
} | msmtp "$TO_ADDRESS"