#blktrace -d /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 -o - | blkparse -i - -a issue -o trace2.blktrace

#sudo blktrace -d /dev/sdb1 -o - | blkparse -i - -o trace.blktrace

#blktrace -d /dev/sdb1 -o - | blkparse -i - -d trace.bin

#blktrace -d /dev/md0 -o - | blkparse -i - -o trace.blktrace
echo 's' | sudo -S blktrace -d /dev/sdb1 -o - | blkparse -i - -a issue -o trace.blktrace

#echo 's' | sudo -S blktrace -d /dev/sdb1 -o - | blkparse -a issue -i - -o trace.blktrace

#blktrace -d /dev/sda -o - | blkparse -i - -o trace.blktrace

