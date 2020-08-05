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
sysctl kernel.randomize_va_space=0
sysctl kernel.sched_child_runs_first=1

# Block Settings Restore
for i in /sys/block/*/queue do
	echo 128 > $i/nr_requests
	echo 128 > $i/read_ahead_kb
done

# com.tencent.tmgp.sgame
File=/data/data/com.tencent.tmgp.sgame/shared_prefs/com.tencent.tmgp.sgame.v2.playerprefs.xml

sed -i '/.*<int name="EnableVulkan" value=".*" \/>/'d "$File"
sed -i '/.*<int name="EnableGLES3" value=".*" \/>/'d "$File"
sed -i '/.*<int name="EnableMTR" value=".*" \/>/'d "$File"
sed -i '/.*<int name="DisableMTR" value=".*" \/>/'d "$File"
sed -i '3a \ \ \ \ <int name="EnableVulkan" value="3" \/>' "$File";
sed -i '4a \ \ \ \ <int name="EnableGLES3" value="2" \/>' "$File";
sed -i '5a \ \ \ \ <int name="EnableMTR" value="1" \/>' "$File";
sed -i '6a \ \ \ \ <int name="DisableMTR" value="3" \/>' "$File";
