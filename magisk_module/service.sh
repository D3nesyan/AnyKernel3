#!/system/bin/sh

# PaperMoon Specific Magisk Module
# Copyright (C) 2020 Ratoriku <a1063021545@gmail.com>

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
   

# blkio configuration from coral
echo 1000 > /dev/blkio/blkio.weight
echo 200 > /dev/blkio/background/blkio.weight
echo 2000 > /dev/blkio/blkio.group_idle
echo 0 > /dev/blkio/background/blkio.group_idle
