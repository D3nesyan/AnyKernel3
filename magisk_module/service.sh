#!/system/bin/sh

# PaperMoon Specific Magisk Module
# Copyright (C) 2020 Ratoriku <a1063021545@gmail.com>
MODDIR=${0%/*}

# EAS Optimizations
setprop sys.use_fifo_ui 1

# MemeUI
# Try to block miuibooster
# stop miuibooster

# TAboost
echo 1 > /dev/stune/top-app/schedtune.boost

# schedhorizon
echo "1113600 1536000" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/efficient_freq
echo "40 50" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/up_delay
# echo "1747200 2150400" > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/efficient_freq
# echo "40 50" > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/up_delay

# com.tencent.tmgp.sgame
File=/data/data/com.tencent.tmgp.sgame/shared_prefs/com.tencent.tmgp.sgame.v2.playerprefs.xml
 
sed -i '/.*<int name="VulkanTryCount" value=".*" \/>/'d "$File"
sed -i '/.*<int name="EnableVulkan" value=".*" \/>/'d "$File"
sed -i '/.*<int name="EnableGLES3" value=".*" \/>/'d "$File"
sed -i '/.*<int name="EnableMTR" value=".*" \/>/'d "$File"
sed -i '/.*<int name="DisableMTR" value=".*" \/>/'d "$File"
sed -i '2a \ \ \ \ <int name="VulkanTryCount" value="1" \/>' "$File";
sed -i '3a \ \ \ \ <int name="EnableVulkan" value="3" \/>' "$File";
sed -i '4a \ \ \ \ <int name="EnableGLES3" value="1" \/>' "$File";
sed -i '5a \ \ \ \ <int name="EnableMTR" value="1" \/>' "$File";
sed -i '6a \ \ \ \ <int name="DisableMTR" value="3" \/>' "$File";
 
