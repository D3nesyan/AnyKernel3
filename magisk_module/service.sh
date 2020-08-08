#!/system/bin/sh

# PaperMoon Specific Magisk Module
# Copyright (C) 2020 Ratoriku <a1063021545@gmail.com>
MODDIR=${0%/*}

# Sound
sed -i '/HPHL Volume/c\    <ctl name="HPHL Volume" value="18" />' /vendor/etc/mixer_paths.xml
sed -i '/HPHR Volume/c\    <ctl name="HPHR Volume" value="18" />' /vendor/etc/mixer_paths.xml

# Disable MIUI AD
miui=`getprop ro.miui.notch`
if [ "$miui" == "1" ]; then
rm -rf /data/media/0/miad
echo "" > /data/media/0/miad
fi

# Optimizations
stop energy-awareness
if [ "$miui" == "1" ]; then
stop miuibooster
fi
sysctl kernel.sched_child_runs_first=1

# Block Settings Restore
for i in /sys/block/*/queue do
	echo 128 > $i/nr_requests
	echo 128 > $i/read_ahead_kb
done
