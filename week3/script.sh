#!/bin/bash

amount=$(grep "processor" /proc/cpuinfo | wc -l)

if [ $amount -lt 2 ]; then
	echo "Warning! Less than 2 CPUs"
else
	echo "You have $amount CPUs!"
fi
