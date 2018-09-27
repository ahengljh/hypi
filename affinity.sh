#!/bin/bash

folders=/proc/irq/*;
for folder in $folders; do
files="$folder/*";
for file in $files; do
if [[ $file == *"nvme"* ]]; then
echo $file;
contents=`cat $folder/affinity_hint`;
echo $contents > $folder/smp_affinity;
cat $folder/smp_affinity;
fi
done
done
