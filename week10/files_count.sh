#!/bin/bash
count=`ls /tmp | wc -l`

if [ $count -gt $1 ]; then
echo "There are more than $1 files" >> error.dat

fi
