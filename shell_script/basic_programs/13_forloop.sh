#!/bin/bash
#for loop


#type1
for i in 1 2 3 4 5
do
	echo $i
done

#type2
echo ""
for j in {1..20}
do
	echo $j
done

#type3
echo ""
for k in My name is vinit
do
	echo $k
done

#type4
echo ""
myarray=( 1 "two" 3 4.4 five "six" 7 )
lenght=${#myarray[*]}
for (( i=0;i<$lenght;i++ ))
do
	echo ${myarray[$i]}
done
