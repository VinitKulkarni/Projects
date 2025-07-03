#!/bin/bash
#simple if-else

read -p "Enter the age to check voting elgibility:" age
echo "You have entered age is: $age"

if [ $age -gt 18 ]
then
	echo "YES!!! You are Elgible to Vote"
else
	echo "Opps!!! You are Not Elgible to Vote"
fi
