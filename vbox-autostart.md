# VirtualBox autostart on Linux (tested on Debian & Ubuntu)

main ref: [VirtualBox Manual - Starting Virtual Machines During System Boot](https://www.virtualbox.org/manual/ch09.html#autostart)

## 1. Create /etc/default/virtualbox
sample content of /etc/default/virtualbox
```
# defaults file for virtualbox
# adapted from rsync
# ref: https://docs.oracle.com/en/virtualization/virtualbox/7.0/user/AdvancedTopics.html#autostart
#
# VBOXAUTOSTART_DB contains an absolute path to the autostart database directory. 
# The directory should have write access for every user who should be able 
# to start virtual machines automatically. Furthermore the directory should have 
# the sticky bit set. 
VBOXAUTOSTART_DB=/var/lib/virtualbox

# VBOXAUTOSTART_CONFIG points the service to the autostart configuration file 
# which is used during boot to determine whether to allow individual users 
# to start a VM automatically and configure startup delays. The configuration file 
# can be placed in /etc/vbox and contains several options. One is default_policy 
# which controls whether the autostart service allows or denies to start a VM for users 
# which are not in the exception list. The exception list starts with exception_list 
# and contains a comma separated list with usernames. Furthermore a separate startup delay 
# can be configured for every user to avoid overloading the host.
VBOXAUTOSTART_CONFIG=/etc/vbox/autostart.cfg
```

## 2. Create autostart database directory
```
$ sudo mkdir /var/lib/virtualbox
$ sudo chmod 1770 /var/lib/virtualbox
$ sudo chgrp vboxusers /var/lib/virtualbox
$ ls -ld /var/lib/virtualbox
drwsrws--T 2 root vboxusers 4096 May  3  2023 /var/lib/virtualbox
```

## 3. Create autostart policy file
sample content of /etc/vbox/autostart.cfg:
```
# Default policy is to deny starting a VM, the other option is "allow".
default_policy = deny

# Bob is allowed to start virtual machines but starting them
# will be delayed for 10 seconds
bob = {
    allow = true
    startup_delay = 10
}

# Alice is not allowed to start virtual machines, useful to exclude certain users
# if the default policy is set to allow.
alice = {
    allow = false
}
```

## 4. Enable autostart from each user 
Any user who wants to enable autostart for individual machines 
must set the path to the autostart database directory 
with the following command, only need to run once:
```
$ VBoxManage setproperty autostartdbpath /var/lib/virtualbox
```

## 5. Enable or disable specific VM to autostart
To enable specific VM:
```
VBoxManage modifyvm {VMname or UUID} --autostart-enabled on
```

To disable specific VM:
```
VBoxManage modifyvm {VMname or UUID} --autostart-enabled off
```
