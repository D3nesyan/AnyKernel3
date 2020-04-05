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
chattr -R -i /vendor/etc/init/hw/;
chattr -R -i /vendor/bin/;
chattr -R -i /vendor/etc/perf/;
cp -f $home/vendor/etc/init/hw/* /vendor/etc/init/hw;
cp -f $home/vendor/bin/* /vendor/bin;
rm -f /vendor/etc/perf/perfboostsconfig.xml;
chmod -R 0644 /vendor/etc/init/hw/*;
chmod -R 0755 /vendor/bin/init.spectrum.sh;
chattr -R +i /vendor/etc/init/hw/;
chattr -R +i /vendor/bin/;
chattr -R +i /vendor/etc/perf/;
mount -o ro,remount -t auto /vendor;

## AnyKernel install
dump_boot;

write_boot;
## end install

