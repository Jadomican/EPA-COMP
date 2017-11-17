#!/bin/bash

mpstat -P ALL 10 1 -o JSON | jq

