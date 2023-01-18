# query IPMI locally

## check mc info
```
# ipmitool mc info
```
sample output:
```
Device ID                 : 32
Device Revision           : 0
Firmware Revision         : 1.24
IPMI Version              : 2.0
Manufacturer ID           : 2
Manufacturer Name         : IBM
Product ID                : 220 (0x00dc)
Product Name              : Unknown (0xDC)
Device Available          : yes
Provides Device SDRs      : no
Additional Device Support :
    Sensor Device
    SDR Repository Device
    SEL Device
    FRU Inventory Device
    IPMB Event Receiver
    IPMB Event Generator
    Chassis Device
Aux Firmware Rev Info     : 
    0x00
    0x00
    0x1b
    0x41
```
## check sensor
```
# ipmitool sensor
```
sample output:
```
Ambient Temp     | 32.000     | degrees C  | ok    | na        | na        | na        | 38.000    | 41.000    | 45.000    
Altitude         | 2680.000   | feet       | ok    | na        | na        | na        | na        | na        | na        
Avg Power        | 100.000    | Watts      | ok    | na        | na        | na        | na        | na        | na        
Planar 3.3V      | 3.351      | Volts      | ok    | na        | 3.039     | na        | na        | 3.564     | na        
Planar 5V        | 4.995      | Volts      | ok    | na        | 4.475     | na        | na        | 5.582     | na        
Planar 12V       | 12.150     | Volts      | ok    | na        | 10.692    | na        | na        | 13.446    | na        
Planar VBAT      | 2.629      | Volts      | ok    | na        | 2.095     | 2.248     | na        | na        | na        
Fan 1A Tach      | 3393.000   | RPM        | ok    | na        | 290.000   | na        | na        | na        | na        
Fan 1B Tach      | 2500.000   | RPM        | ok    | na        | 250.000   | na        | na        | na        | na        
Fan 2A Tach      | 2726.000   | RPM        | ok    | na        | 290.000   | na        | na        | na        | na        
Fan 2B Tach      | 1900.000   | RPM        | ok    | na        | 250.000   | na        | na        | na        | na        
Fan 3A Tach      | 3683.000   | RPM        | ok    | na        | 290.000   | na        | na        | na        | na        
Fan 3B Tach      | 2925.000   | RPM        | ok    | na        | 250.000   | na        | na        | na        | na        
Fan 1            | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Fan 2            | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Fan 3            | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Front Panel      | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
```
## alt check sensor
```
# ipmitool sdr
```
sample output:
```
Ambient Temp     | 32 degrees C      | ok
Altitude         | 2680 feet         | ok
Avg Power        | 100 Watts         | ok
Planar 3.3V      | 3.35 Volts        | ok
Planar 5V        | 4.99 Volts        | ok
Planar 12V       | 12.15 Volts       | ok
Planar VBAT      | 2.63 Volts        | ok
Fan 1A Tach      | 3393 RPM          | ok
Fan 1B Tach      | 2525 RPM          | ok
Fan 2A Tach      | 2726 RPM          | ok
Fan 2B Tach      | 1875 RPM          | ok
Fan 3A Tach      | 3683 RPM          | ok
Fan 3B Tach      | 2925 RPM          | ok
Fan 1            | 0x00              | ok
Fan 2            | 0x00              | ok
Fan 3            | 0x00              | ok
Front Panel      | 0x00              | ok
```
## check status
```
# ipmitool status | on | off | cycle | reset | diag | soft
```

# IPMI remote access setup
## check current IPMI LAN setup
```
# ipmitool lan print
```
sample output:
```
Set in Progress         : Set Complete
Auth Type Support       : NONE MD2 MD5 PASSWORD 
Auth Type Enable        : Callback : 
                        : User     : MD2 MD5 PASSWORD 
                        : Operator : MD2 MD5 PASSWORD 
                        : Admin    : MD2 MD5 PASSWORD 
                        : OEM      : 
IP Address Source       : Other
IP Address              : 192.168.70.125
Subnet Mask             : 255.255.255.0
MAC Address             : aa:bb:cc:xx:yy:zz
SNMP Community String   : public
IP Header               : TTL=0x40 Flags=0x40 Precedence=0x00 TOS=0x10
BMC ARP Control         : ARP Responses Enabled, Gratuitous ARP Disabled
Gratituous ARP Intrvl   : 2.0 seconds
Default Gateway IP      : 0.0.0.0
Default Gateway MAC     : 00:00:00:00:00:00
Backup Gateway IP       : 0.0.0.0
Backup Gateway MAC      : 00:00:00:00:00:00
802.1q VLAN ID          : Disabled
802.1q VLAN Priority    : 0
RMCP+ Cipher Suites     : 0,1,2,3,4
Cipher Suite Priv Max   : uaaaaXXXXXXXXXX
                        :     X=Cipher Suite Unused
                        :     c=CALLBACK
                        :     u=USER
                        :     o=OPERATOR
                        :     a=ADMIN
                        :     O=OEM
Bad Password Threshold  : Not Available
```

## set IP address & netmask
```
# ipmitool lan set 1 ipaddr 192.168.123.123
# ipmitool lan set 1 netmask 255.255.255.0
```

## list existing userid
```
# ipmitool user list 1
```
sample output:
```
ID  Name	     Callin  Link Auth	IPMI Msg   Channel Priv Limit
1                    true    false      false      NO ACCESS
2   USERID           true    false      true       ADMINISTRATOR
3                    true    false      false      NO ACCESS
```
## create new userid, set password, and give access
```
# ipmitool user set name 1 <New User ID>
# ipmitool user set password 1 <New Password>
# ipmitool user priv <User ID> <Privilege Level> 1
# ipmitool channel setaccess 1 <User ID> link=on ipmi=on callin=on privilege=3
```

Privilege Levels are:
| code | privilege |
| ---- | ----------- |
| 0x1 | Callback |
| 0x2 | User |
| 0x3 | Operator |
| 0x4 | Administrator |
| 0x5 | OEM Proprietary |
| 0xF | No Access |

# remote access
## turn on power
```
$ ipmitool -H {ip_address} -U {username} -a chassis power on
$ ipmitool -I lanplus -H {ip_address} -U {username} -a chassis power on
```

## print system event log
```
$ ipmitool -H {ip_address} -U {username} -a sel list
```

## turn on/off/on for N seconds locator LED
```
$ ipmitool -H {ip_address} -U {username} -P {password} chassis identify force
$ ipmitool -H {ip_address} -U {username} -P {password} chassis identify 0
$ ipmitool -H {ip_address} -U {username} -P {password} chassis identify {N}
```
# troubleshooting
## verify kernel modules on server
```
$ lsmod grep -e 'ipmi_(devintf|si)'
```
## ping remote access IP address

