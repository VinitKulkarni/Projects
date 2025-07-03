#!/bin/bash
#swap two variables

a=10
b=20

echo "before swapping a=$a and b=$b"

temp=$a
a=$b
b=$temp

echo "after swapping a=$a and b=$b"
