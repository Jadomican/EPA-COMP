#!/bin/bash
#Jason Domican - X00119321
#Must have loadtest (executable) in same directory as this script
#Script takes one parameter - the total number of users to test

min_users=1
max_users=100
test_duration=5		#Length of time (seconds) to run loadtest for

if [ ! -f loadtest ]; then	#Check loadtest file exists before running
echo "Loadtest (executable) not found, please compile loadtest.C"
elif [ $1 -lt $min_users ] || [ $1 -gt $max_users ]; then	#Ensure valid number of users
echo  "Invalid number, please enter a number between $min_users and $max_users"
else
echo "Testing $1 users for $test_duration seconds..."

echo -e "C0 \t N \t idle" > results.dat	#-e flag allows backslash characters to be used

for ((i=$min_users; i<=$1; i++))		#Number of users increases each time
do
./loadtest $i &		#Run loadtest in background

idle_time=$(mpstat $test_duration 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle') #Collect 1 sample for test duration (JSON format)
pkill loadtest		#Kill loadtest process after running for test duration

num_completions=$(cat synthetic.dat | grep -c "Transaction Complete")	#Get number of transactions completed (C0) 

echo -e "$num_completions \t $i \t $idle_time" >> results.dat  #Append results to results.dat

done
fi
