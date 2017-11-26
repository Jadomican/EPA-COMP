#!/bin/bash
#must have loadtest (executable) in same directory as this script

minUsers=1
maxUsers=50
testduration=5		#Length of time to run loadtest for

if [ $1 -lt $minUsers ] || [ $1 -gt $maxUsers ]; then	#Ensure valid number of users
echo  "Invalid number, please enter a number between $minUsers and $maxUsers"
else
echo "Testing $1 users for $testduration seconds..."

./loadtest $1 &		#Run loadtest in background

mpstat $testduration 1 -o JSON

pkill loadtest		#Kill loadtest process after running for testduration


fi
