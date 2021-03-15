#!/system/bin/sh
MODDIR=${0%/*}

# Optimizations
stop energy-awareness
miui=$(file_getprop /system/build.prop ro.miui.notch);
if [ "$miui" == "1" ]; then
stop miuibooster
fi

#function write() {
#    echo -n $2 > $1
#}
