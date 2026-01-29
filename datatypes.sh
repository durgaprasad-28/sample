#!/bin/bash
NUM1=100
NUM2=250
NUM3=$(($NUM1+$NUM2))
echo "the sum is $NUM3"
PLAYERS=("messi" "neymar" "mbappe" "ronaldo")
echo "${PLAYERS[@]}"
echo "${PLAYERS[0]}"
echo "${PLAYERS[1]}"
echo "${PLAYERS[2]}"
echo "${PLAYERS[3]}"
