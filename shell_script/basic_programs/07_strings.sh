#!/bin/bash
#String manipulation basics

myString="Hii Vinit, How are You Brother!!!"

echo "String = $myString"

echo "Length of String = ${#myString}"

echo "String upper: ${myString^^}"

echo "String lower: ${myString,,}"

echo "Replace Vinit with Raju: ${myString/Vinit/Raju}"

echo "Slice: ${myString:28:32}"
