#!/bin/sh

dev_name=$1

echo 's' | sudo -S mkfs.ext4 -E lazy_itable_init=0,lazy_journal_init=0 $dev_name
