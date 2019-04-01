#!/bin/bash

# try to clean up errant loopback mounts
umount mnt/1 || true
umount mnt/2 || true

./scripts/build_ubuntu_sdcard.sh  boards/enclustra-mercury-aa1-pe1 refdes system && \
pxz sdimage.img

# make sure everything is unmounted
umount mnt/1 || true
umount mnt/2 || true
