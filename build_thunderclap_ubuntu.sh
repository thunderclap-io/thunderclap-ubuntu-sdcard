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

# remove old images
rm -f sdimage.img sdimage.img.xz
rm -rf mnt

# copy in the thunderclap binary to the image
mkdir payload
mkdir payload/root
mv build-arm/thunderclap payload/root/thunderclap

# build the SD card and compress it
./scripts/build_ubuntu_sdcard.sh  boards/enclustra-mercury-aa1-pe1 refdes system payload libpixman-1-0 && \
pxz sdimage.img

# make sure everything is unmounted
umount_multiple mnt/1
umount_multiple mnt/2
