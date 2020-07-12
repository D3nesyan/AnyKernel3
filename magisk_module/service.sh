#!/system/bin/sh

# PaperMoon Specific Magisk Module
# Copyright (C) 2020 Ratoriku <a1063021545@gmail.com>
MODDIR=${0%/*}

# set default schedTune value for foreground/top-app
echo 1 > /dev/stune/foreground/schedtune.prefer_idle
echo 10 > /dev/stune/top-app/schedtune.boost
echo 1 > /dev/stune/top-app/schedtune.prefer_idle

# Sound
sed -i '/HPHL Volume/c\    <ctl name="HPHL Volume" value="18" />' /vendor/etc/mixer_paths.xml
sed -i '/HPHR Volume/c\    <ctl name="HPHR Volume" value="18" />' /vendor/etc/mixer_paths.xml

# Disable MIUI AD
miui=`getprop ro.miui.notch`
if [ "$miui" == "1" ]; then
rm -rf /data/media/0/miad
echo "" > /data/media/0/miad
fi

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
