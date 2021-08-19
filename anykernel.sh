# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=NekoKernel by Ratoriku
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
if [ ! -e "/vendor/etc/powerhint.json" ]; then
  ui_print " " "HMP ROM Detected!"
  ui_print "Creating Meow Magisk Module..."
  rm -rf /data/adb/modules/meow;
  cp -rf $home/magisk_module /data/adb/modules/meow;
else
  ui_print " " "EAS ROM Detected!"
  ui_print "Skipping Magisk Module installation..."
fi

## AnyKernel install
split_boot;

flash_boot;
flash_dtbo;
## end install

