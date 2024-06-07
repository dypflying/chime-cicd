#!/bin/sh

rm -f  ~/chime-centos8.5.2111.iso 
genisoimage  -joliet-long -o ~/chime-centos8.5.2111.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -J -v -cache-inodes -T -eltorito-alt-boot -e images/efiboot.img  -no-emul-boot /soft/centos
