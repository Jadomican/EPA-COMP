#!/bin/bash

echo "Timestamp"
mpstat -o JSON | jq '.sysstat.hosts[].statistics[].timestamp'

sleep 1

echo "Idle Time"
mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'

sleep 1

echo "10 second interval, collects 1 sample, calculate busy time"

mpstat 10 1 -o JSON | jq '100 - .sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'

