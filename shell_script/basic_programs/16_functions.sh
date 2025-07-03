#!/bin/bash
#function program

function welcomeNote {
	echo "weclome to shell scripting $1"
}

read -p "Enter the name:" name

#function call with argument
welcomeNote $name
