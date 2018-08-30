#!/bin/bash
# setup IPv6 6to4 on ancient distro :D
# prerequisite: host must have public IPv4 address

ipv4=`ip a | grep inet | grep -v inet6 | awk '{print $2}' | egrep -ve '^(127|10|100\.6[4-9]|100\.[7-9][0-9]|100\.1[0-1][0-9]|100\.12[0-7]|172\.1[6-9]|172\.2[0-9]|172\.3[0-1]|192\.168)\.' | sed -e 's/\/.*$//'`
ipv6=$(printf "2002:%02x%02x:%02x%02x::1" `echo $ipv4 | tr "." " "`)
#echo $ipv4
#echo $ipv6
#exit 0

sudo ip tunnel add tun6to4 mode sit remote any local $ipv4
sudo ip link set dev tun6to4 up
sudo ip add add $ipv6/16 dev tun6to4
sudo ip route add 2000::/3 via ::192.88.99.1 dev tun6to4 metric 1
