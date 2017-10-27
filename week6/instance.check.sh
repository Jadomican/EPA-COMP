#!/bin/bash

status=$(aws ec2 describe-instance-status --instance-id $1 --query 'InstanceStatuses[*].InstanceState.Name' --output text)

if [ -z "$status" ]; then
	echo "Instance is not running or doesn't exist"
elif [ $status = "running" ]; then
        echo "Instance is running"
fi

