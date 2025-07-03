#!/bin/bash
#iterat names from a file

FILE=/c/Users/vinit/Music/Shell_Scripting/basics/names.txt

for names in $(cat $FILE)
do
	echo $names
done
