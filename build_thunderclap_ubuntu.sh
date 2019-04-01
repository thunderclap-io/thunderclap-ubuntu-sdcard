#!/bin/bash
./scripts/build_ubuntu_sdcard.sh  boards/enclustra-mercury-aa1-pe1 refdes system && \
pxz sdimage.img
