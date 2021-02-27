#!/system/bin/sh
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
    chmod 0444 $memlat/governor
done
