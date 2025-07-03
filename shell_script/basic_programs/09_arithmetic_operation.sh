#!/bin/bash
#arthematic operation & "let"

a=10
b=10

<<comment
add=$a+$b
echo $add
this is treat like string
comment

#type1
add=$(($a+$b))
echo $add

#type2
let addit=$a+$b
echo $addit
