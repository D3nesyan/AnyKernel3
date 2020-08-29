#!/system/bin/sh

# PaperMoon Specific Magisk Module
# Copyright (C) 2020 Ratoriku <a1063021545@gmail.com>
MODDIR=${0%/*}

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
sysctl kernel.sched_wakeup_granularity_ns=5000000
sysctl kernel.sched_rt_runtime_us=980000

# 修复王者荣耀闪退
chmod 000 /data/data/com.tencent.tmgp.sgame/files/tss_tmp

# Block Settings Restore
for i in /sys/block/*/queue do
	echo 128 > $i/nr_requests
	echo 128 > $i/read_ahead_kb
done
