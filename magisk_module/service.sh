#!/system/bin/sh

# Meow Specific Magisk Module
# Copyright (C) 2020 Ratoriku <a1063021545@gmail.com>
MODDIR=${0%/*}

# Optimizations
stop energy-awareness
if [ "$miui" == "1" ]; then
stop miuibooster
fi
