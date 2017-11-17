#!/bin/bash


./loadtest $1 &

sleep $2

pkill loadtest
