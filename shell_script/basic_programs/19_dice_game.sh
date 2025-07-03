#!/bin/bash
#generating random number between 1 to 6
#set -x #to debug
user1=0
user2=0
count=0

while [ $user1 -le 10 ] && [ $user2 -le 10 ]
do
	diceValue=$(( $RANDOM % 6 + 1 ))
	if [ $count -eq 0 ]
	then
		let user1=$(($user1+$diceValue))
		let count++
	else
		let user2=$(($user2+$diceValue))
		let count--
	fi
done

if [ $user1 -gt $user2 ]
then
	echo "user1 won with $user1"
	echo "user2 lost with $user2"
else
	echo "user2 won with $user2"
	echo "user1 lost with $user1"
fi
