#!/system/bin/sh

# Meow Specific Magisk Module
# Copyright (C) 2020 Ratoriku <a1063021545@gmail.com>
MODDIR=${0%/*}

# Optimizations
stop energy-awareness
miui=$(file_getprop /system/build.prop ro.miui.notch);
if [ "$miui" == "1" ]; then
stop miuibooster
fi

function write() {
    echo -n $2 > $1
}

# Use powersave governor for memlat
for memlat in /sys/class/devfreq/*qcom,memlat-cpu*
do
    write $memlat/governor "powersave"
done
