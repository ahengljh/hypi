#!/bin/sh

./performancemode.sh

rm result-poll.txt

echo 1 > /sys/block/nvme1n1/queue/io_poll
echo -1 > /sys/block/nvme1n1/queue/io_poll_delay

echo "polling-based i/o sevices" >> result-poll.txt

RW=randread
#:<<'END'
THREADS="1"
#BLOCK_SIZE="512 1024 2048 4096 8192 16384 32768 65536 131072"
#BLOCK_SIZE="4096-6143 6144-8191 8192-12287 12288-16383 16384-23551 23552-32765 32768-47103 47104-65535 65536-93183 93184-131071 4096-131072"
BLOCK_SIZE=65536

for job in $THREADS
do
for bs in $BLOCK_SIZE
do

fio --name=OptaneInitialPerfTest --ioengine=pvsync2 --hipri --direct=1 --buffered=0 --size=100% --randrepeat=0 --time_based --ramp_time=0 --norandommap --refill_buffers --group_reporting  --percentile_list=1.0:25.0:50.0:75.0:90.0:99.0:99.9:99.99:99.999:99.9999:99.99999:99.999999:100.0  --filename=/dev/nvme1n1 --bs=$bs --iodepth=1 --numjobs=$job --rw=$RW --runtime=60 >> result-poll.txt

sleep 10
done
done
#END

#fio --name=OptaneInitialPerfTest --ioengine=pvsync2 --hipri --direct=1 --buffered=0 --size=100% --randrepeat=0 --time_based --ramp_time=0 --norandommap --refill_buffers --group_reporting  --percentile_list=1.0:25.0:50.0:75.0:90.0:99.0:99.9:99.99:99.999:99.9999:99.99999:99.999999:100.0  --filename=/dev/nvme1n1 --bs=512 --iodepth=1 --numjobs=6 --rw=$RW --runtime=60 >> result-poll.txt

