#!/bin/sh

FILENAME=$1

echo IOPS
cat $1 | grep 'IOPS' | awk -F'[:,=%]' '{print $3}'
echo latency
cat $1 | grep 'sec):' | awk -F'[:,=%]' '{print $7}'
echo CPU utilization
cat $1 | grep 'cpu' | awk -F'[:,=%]' '{print $3+$6}'
