#!/bin/sh

while :
do
	if [ -f "fio_start" ]; then
		echo '\nfio start\n'
		fio $1
		echo '\nfio end\n'
		touch 'fio_end'
		break;
	else
		sleep 1
	fi
done
