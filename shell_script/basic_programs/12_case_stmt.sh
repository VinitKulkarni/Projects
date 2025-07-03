#!/bin/bash
#if elif program
#[&& and]  [|| or]


read -p "Enter the marks:" marks

if [ $marks -ge 95 ]; then
    echo "Pass with extraordinary"
elif [ $marks -ge 80 ] && [ $marks -lt 95 ]; then
    echo "Pass with distinction"
elif [ $marks -ge 65 ] && [ $marks -lt 80 ]; then
    echo "Pass with first class"
elif [ $marks -ge 50 ] && [ $marks -lt 65 ]; then
    echo "Pass with second class"
elif [ $marks -ge 35 ] && [ $marks -lt 50 ]; then
    echo "You are just pass"
else
    echo "You have FAILED"
fi
