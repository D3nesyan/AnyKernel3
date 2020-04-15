# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Barairo Kernel by Ratoriku@github.com
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
mount -o rw,remount -t auto /vendor;
chattr -R -i /vendor/etc/perf/;
rm -f /vendor/etc/perf/perfboostsconfig.xml;
chattr -R +i /vendor/etc/perf/;
mount -o ro,remount -t auto /vendor;

## AnyKernel install
dump_boot;

write_boot;
## end install

