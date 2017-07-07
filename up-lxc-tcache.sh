#!/bin/bash
# based on http://www.panticz.de/Update-LXC-container-templates-filesystem

# ensure that this script is run as root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# set language to english
LANG=en_US.UTF-8

# update APT rootfs (Debian and Ubuntu)
for DIST in $(find /var/cache/lxc/*/* -maxdepth 0 -type d|grep -v download); do
  echo "========================================"
  date
  echo "Updating ${DIST} ..."
  mkdir -p ${DIST}/dev/pts
  mount --bind /dev/pts ${DIST}/dev/pts
  mount -t proc proc ${DIST}/proc
  mount -t sysfs sys ${DIST}/sys
  chroot "${DIST}" apt update -qq
  chroot "${DIST}" apt full-upgrade -qq -y --no-install-recommends
  chroot "${DIST}" apt-get autoremove -qq -y
  chroot "${DIST}" apt-get clean
  umount ${DIST}/dev/pts
  umount ${DIST}/sys
  umount ${DIST}/proc
done
