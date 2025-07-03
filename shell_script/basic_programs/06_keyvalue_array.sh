#!/bin/bash
#key value paired array

declare -A keyarray

keyarray=( [name]=vinit [age]=28 [temp]="kddk" )
echo "Name is ${keyarray[name]}"
echo "temp value ${keyarray[temp]}"
