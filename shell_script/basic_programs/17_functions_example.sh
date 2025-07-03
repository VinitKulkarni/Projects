#!/bin/bash
#addition function

function addition {
	let add=$(($1+$2))
	echo "addition of $1 and $2 is: $add"
}

function modules {
	let mod=$(($1%$2))
	echo "modulation of $1 and $2 is: $mod"
}

read -p "enter the number:" number1
read -p "enter the number:" number2

addition $number1 $number2
modules $number1 $number2

