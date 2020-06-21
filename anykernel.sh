# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=PaperMoon Kernel by Ratoriku@github.com
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=lavender
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

# Extra
ui_print " " "Creating Majutsu Reiso Magisk Module ..."
rm -rf /data/adb/modules/barairo;
cp -rf $home/magisk_module /data/adb/modules/barairo;

## AnyKernel install
split_boot;

# Screen OC
ui_print "Detecting Screen OC..."
case "$ZIPFILE" in
  *62fps*|*62hz*)
    ui_print "Detected! Setting 62 Hz refresh rate..."
    patch_cmdline "mdss_dsi.framerate_override" "mdss_dsi.framerate_override=62"
    ;;
  *66fps*|*66hz*)
    ui_print "Detected! Setting 66 Hz refresh rate..."
    patch_cmdline "mdss_dsi.framerate_override" "mdss_dsi.framerate_override=66"
    ;;
  *68fps*|*68hz*)
    ui_print "Detected! Setting 68 Hz refresh rate..."
    patch_cmdline "mdss_dsi.framerate_override" "mdss_dsi.framerate_override=68"
    ;;
  *69fps*|*69hz*)
    ui_print "Detected! Setting 69 Hz refresh rate..."
    patch_cmdline "mdss_dsi.framerate_override" "mdss_dsi.framerate_override=69"
    ;;
  *70fps*|*70hz*)
    ui_print "Detected! Setting 70 Hz refresh rate..."
    patch_cmdline "mdss_dsi.framerate_override" "mdss_dsi.framerate_override=70"
    ;;
  *)
    ui_print "Nothing was Detected! Setting default 60 Hz refresh rate..."
    patch_cmdline "mdss_dsi.framerate_override" "mdss_dsi.framerate_override=60"
esac

flash_boot;
flash_dtbo;
## end install

