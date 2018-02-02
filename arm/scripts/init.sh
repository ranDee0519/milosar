#!/bin/sh   
clear
echo "---> Enabling Read-Write" 
rw
echo "---> Creating Storage Directory"
mkdir /media/storage  
echo "---> Available Partitions:"
blkid
echo "---> Mounting Storage Partition"
mount /dev/mmcblk0p3 /media/storage

echo "---> Date and Time:"
date
echo "---> Loading system_wrapper.bit Bitstream"
cat system_wrapper.bit > /dev/xdevcfg
echo "---> Initialization Complete"

