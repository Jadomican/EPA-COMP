#!/bin/bash
#Jason Domican - X00119321
#Must have loadtest (executable) in same directory as this script
#Script takes one parameter - the total number of users to test

minUsers=1
maxUsers=50
testduration=5		#Length of time (seconds) to run loadtest for

if [ $1 -lt $minUsers ] || [ $1 -gt $maxUsers ]; then	#Ensure valid number of users
echo  "Invalid number, please enter a number between $minUsers and $maxUsers"
else
echo "Testing $1 users for $testduration seconds..."

echo -e "N \t idle" > results.dat	#-e flag allows backslash characters to be used

for ((i=$minUsers; i<=$1; i++))		#Number of users increases each time
do
./loadtest $i &		#Run loadtest in background
output=$(mpstat $testduration 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle') #Collect 1 sample for test duration (JSON format)

echo -e "$i \t $output" >> results.dat  #Append results to results.dat

pkill loadtest		#Kill loadtest process after running for test duration
sleep 1			#Allow time to cooldown
echo "DONE $i"
done
fi
