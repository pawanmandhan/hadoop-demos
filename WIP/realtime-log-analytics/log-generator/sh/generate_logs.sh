#!/bin/bash

set +vx
#timeout 2s date +'%d/%m/%Y %H:%M:%S:%3N'

line_per_min=30
time_limit=10
. ./logger.sh $line_per_min $time_limit > log & 
logger_pid=$!
sleep ${time_limit}
kill -9 $logger_pid
