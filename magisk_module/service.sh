#!/system/bin/sh

# Meow Specific Magisk Module
# Copyright (C) 2020 Ratoriku <a1063021545@gmail.com>
MODDIR=${0%/*}

# Optimizations
stop energy-awareness
if [ "$miui" == "1" ]; then
stop miuibooster
fi

# Restore Block Settings
for i in /sys/block/*/queue do
	echo 128 > $i/nr_requests
	echo 128 > $i/read_ahead_kb
done

