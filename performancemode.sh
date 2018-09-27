#!/bin/sh
for CPUFREQ in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor;
do [ -f $CPUFREQ ] || continue; echo -n performance > $CPUFREQ; done

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

folders=/proc/irq/*;
for folder in $folders; do
files="$folder/*";
for file in $files; do
if [[$file == *"nvme"*]]; then
echo $file;
contents='cat $folder/affinity_hint';
echo $contents > $folder/smp_affinity;
cat $folder/smp_affinity;
fi
done
done
