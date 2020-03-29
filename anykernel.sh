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


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

# Extra
mount -o rw,remount -t auto /vendor;
chattr -R -i /vendor/etc/init/hw/;
chattr -R -i /vendor/bin/;
cp -rf $home/vendor/etc/init/* /vendor/etc/init;
cp -rf $home/vendor/bin/* /vendor/bin;
chmod -R 0644 /vendor/etc/init/*;
chmod -R 0755 /vendor/bin/*;
chattr -R +i /vendor/etc/init/hw/;
chattr -R +i /vendor/bin/;
chattr -R -i /vendor/etc/perf/;
rm -rf /vendor/etc/perf/perfboostsconfig.xml;
mount -o ro,remount -t auto /vendor;

## AnyKernel install
dump_boot;

# begin ramdisk changes
# end ramdisk changes

write_boot;
## end install

