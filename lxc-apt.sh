#!/bin/bash
# package update for each lxc VMs

echo "lxc VM package update"
echo "---------------------"
echo "update packages for each running VMs"
for m in `lxc-ls -1 --running`
do
	date
	echo $m
	lxc-attach -n $m -- apt update
	lxc-attach -n $m -- apt upgrade
	echo "====================="
done

echo "update packages for each stopped VMs"
for s in `lxc-ls -1 --stopped`
do
	date
	echo $s
	echo "starting $s..."
	lxc-start -d -n $s
	sleep 5
	lxc-attach -n $s -- apt update
	lxc-attach -n $s -- apt upgrade
	echo "stopping $s..."
	lxc-stop -n $s
	echo "====================="
done


