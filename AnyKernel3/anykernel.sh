### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

properties() { '
kernel.string=AospKSU Kernel 4.9.337 by fwlta
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=starqltechn
device.name2=star2qltechn
device.name3=crownqltechn
device.name4=starqlte
device.name5=star2qlte
device.name6=crownqlte
device.name7=G9600
device.name8=G9650
device.name9=N9600
supported.versions=11 - 16
supported.patchlevels=
'; }

BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

. tools/ak3-core.sh;

if [ -f Image.gz-dtb-starqltechn ] && [ -f Image.gz-dtb-star2qltechn ] && [ -f Image.gz-dtb-crownqltechn ]; then
  case "$device" in
    star2qltechn|star2qlte*|*G9650*)
      ui_print "  -> Galaxy S9+ (star2qltechn) detected";
      cp -f Image.gz-dtb-star2qltechn Image.gz-dtb;
      ;;
    crownqltechn|crownqlte*|*N9600*)
      ui_print "  -> Galaxy Note 9 (crownqltechn) detected";
      cp -f Image.gz-dtb-crownqltechn Image.gz-dtb;
      ;;
    starqltechn|starqlte*|*G9600*|*)
      ui_print "  -> Galaxy S9 (starqltechn) detected";
      cp -f Image.gz-dtb-starqltechn Image.gz-dtb;
      ;;
  esac;
fi;

dump_boot;
write_boot;
