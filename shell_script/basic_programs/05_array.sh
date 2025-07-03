#!/bin/bash
#array

myarray=( 1 2 three four "five" 6.6 "7" )
echo "0th index-> ${myarray[0]}"
echo "4th index-> ${myarray[4]}"
echo "6th index-> ${myarray[6]}"

echo "All elements: ${myarray[*]}"
echo "Length of array: ${#myarray[*]}"

#to get range of values
echo "get 4th & 5th values: ${myarray[*]:5:2}"
echo "get 4th value: ${myarray[*]:5:1}"

#updating the array
myarray+=( "updated" "values" )
echo "all elemenets: ${myarray[*]}"

