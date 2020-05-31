#!/system/bin/sh

# PaperMoon Specific Magisk Module
# Copyright (C) 2020 Ratoriku <a1063021545@gmail.com>
MODDIR=${0%/*}

# Permissions for PaperMoon Manager
chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/*
chmod 0644 /sys/devices/system/cpu/cpu4/cpufreq/*
chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/schedhorizon/*
chmod 0644 /sys/devices/system/cpu/cpu4/cpufreq/schedhorizon/*
chmod 0644 /sys/module/boost_control/parameters/*
chmod 0644 /dev/stune/top-app/schedtune.boost
chmod 0644 /dev/cpuset/audio-app/*
chmod 0644 /dev/cpuset/top-app/*
chmod 0644 /dev/cpuset/foreground/*
chmod 0644 /dev/cpuset/background/*
chmod 0644 /dev/cpuset/system-background/*
chmod 0644 /dev/cpuset/restricted/*
chmod 0644 /sys/class/devfreq/soc:qcom,mincpubw/*
chmod 0644 /sys/class/devfreq/soc:qcom,cpubw/*
chmod 0644 /sys/class/devfreq/soc:qcom,gpubw/*
chmod 0644 /sys/bus/cpu/devices/cpu0/cpufreq/scaling_max_freq
chmod 0644 /sys/bus/cpu/devices/cpu0/cpufreq/scaling_min_freq
chmod 0644 /sys/bus/cpu/devices/cpu4/cpufreq/scaling_max_freq
chmod 0644 /sys/bus/cpu/devices/cpu4/cpufreq/scaling_min_freq

# EAS Optimizations
setprop sys.use_fifo_ui 1

# MemeUI
# Try to block miuibooster
stop miuibooster

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
 
