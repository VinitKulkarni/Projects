#!/bin/bash
#delete the empty files from the directory

dir=/home/ubuntu/shell_script
listOfFiles=$( ls -l $dir | awk '{if ($5 == 0) print $9}' )

count=0
for item in $listOfFiles
do
        let count++
        fileName=$(echo $item | awk '{printf $1}')
        echo $fileName
        rm -f $fileName
done

if [ $count -gt 0 ]
then
        echo "These files are removed from" $dir
else
        echo "No empty files in this" $dir
fi


