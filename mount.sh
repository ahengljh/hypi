#!/bin/sh

dev_name=$1

echo 's' | sudo -S mount -t ext4 $dev_name /home/yongju/mnt/

sudo chown yongju:yongju /home/yongju/mnt/
