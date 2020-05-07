#!/system/bin/sh

# PaperMoon Specific Magisk Module
# Writen by Ratoriku <a1063021545@gmail.com>

echo 1000 > /dev/blkio/blkio.weight 1000
echo 200 > /dev/blkio/background/blkio.weight
echo 2000 > /dev/blkio/blkio.group_idle
echo 0 > /dev/blkio/background/blkio.group_idle
