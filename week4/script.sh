#!/bin/bash

cnt=2

if [ $# -lt $cnt ]; then
echo "Not enough parameters! You need $cnt" 
exit
fi

d=$(date +%Y-%m-%d)

tar -cvf "$1-$d.tar.gz" "$2"
