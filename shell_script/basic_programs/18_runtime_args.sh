#!/bin/bash
#sending arguments at run time


echo "first argument $1"
echo "second argument $2"

echo "total number of arguments $#"
echo "dispaly all argument $@"


#loop through all arguments
echo ""
echo "iteration thorugh loop:"
for i in $@
do
	echo $i
done
