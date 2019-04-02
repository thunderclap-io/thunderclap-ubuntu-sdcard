#!/bin/bash

function umount_multiple
{
	DIR=$1
	while umount $DIR ; do
		echo "Unmounted $DIR"
	done
	true
}

# try to clean up errant loopback mounts
umount_multiple mnt/1
umount_multiple mnt/2

./scripts/build_ubuntu_sdcard.sh  boards/enclustra-mercury-aa1-pe1 refdes system && \
pxz sdimage.img

# make sure everything is unmounted
umount_multiple mnt/1
umount_multiple mnt/2
