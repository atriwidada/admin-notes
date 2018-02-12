#!/bin/bash
# based on http://www.panticz.de/Update-LXC-container-templates-filesystem

LOCKFILE=/var/lock/up-lxc-tcache.lock

# ensure that this script is run as root
if [ $(id -u) -ne 0 ]; then
  sudo $0 $@
  exit
fi

[ -f $LOCKFILE ] && exit 0

trap "{ rm -f $LOCKFILE ; exit 255; }" EXIT
touch $LOCKFILE

# set language to english
LANG=en_US.UTF-8
INTERACTIVE=n

case "$1" in
  interactive)
	  INTERACTIVE=y
	  ;;
  '')
	  ;;
  *)
	  echo "usage: $0 [interactive]"
	  echo "  interactive option will drop into chroot shell after update"
	  echo "  to do manual tasks"
	  exit 0
	  ;;
esac

# update APT rootfs (Debian and Ubuntu)
for DIST in $(find /var/cache/lxc/*/* -maxdepth 0 -type d|grep -v download|grep -v centos); do
  echo "========================================"
  date
  echo "Updating ${DIST} ..."
  mkdir -p ${DIST}/dev/pts
  mount --bind /dev/pts ${DIST}/dev/pts
  mount -t proc proc ${DIST}/proc
  mount -t sysfs sys ${DIST}/sys

  trap "{ umount ${DIST}/dev/pts; umount ${DIST}/proc; umount $DIST/sys; exit 254; }" SIGINT SIGTERM 

  chroot "${DIST}" apt-get update -qq
  chroot "${DIST}" apt-get dist-upgrade -qq -y
  chroot "${DIST}" apt-get autoremove -qq -y
  chroot "${DIST}" apt-get clean

  if [ $INTERACTIVE = y ]; then
    echo "do manual tasks ..."
    echo "^D or exit to continue after finishing manual tasks"
    chroot "${DIST}" /bin/bash
  fi

  umount ${DIST}/dev/pts
  umount ${DIST}/sys
  umount ${DIST}/proc
done
