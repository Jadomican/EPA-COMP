#!/bin/bash
#must have loadtest (executable) in same directory as this script

minUsers=1
maxUsers=50
testduration=5		#Length of time to run loadtest for

if [ $1 -lt $minUsers ] || [ $1 -gt $maxUsers ]; then	#Ensure valid number of users
echo  "Invalid number, please enter a number between $minUsers and $maxUsers"
else
echo "Testing $1 users for $testduration seconds..."

for i in {1..5}
do
./loadtest $i &		#Run loadtest in background

mpstat $testduration 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle' #Collect 1 sample for test duration (JSON format)

pkill loadtest		#Kill loadtest process after running for test duration

echo "DONE $i"
done
fi
