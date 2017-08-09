#!/bin/bash
# package update for each lxc VMs

echo "lxc VM package update"
echo "update packages for each running VMs"
for m in `lxc-ls -1 --running`
do
	date
	echo $m
	lxc-attach -n $m -- apt update
	lxc-attach -n $m -- apt upgrade
done

echo "update packages for each stopped VMs"
for m in `lxc-ls -1 --stopped`
do
	date
	echo $m
	lxc-execute -n $m -- apt update
	lxc-execute -n $m -- apt upgrade
done


