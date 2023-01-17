# query IPMI locally

**check mc info**
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
**check sensor**
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
Video USB        | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
DASD Backplane 1 | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
SAS Riser        | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PCI Riser 1      | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PCI Riser 2      | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
CPU 1            | 0x0        | discrete   | 0x8080| na        | na        | na        | na        | na        | na        
CPU 2            | 0x0        | discrete   | 0x8080| na        | na        | na        | na        | na        | na        
All CPUs         | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
One of The CPUs  | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
IOH Temp Status  | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
CPU 1 OverTemp   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
CPU 2 OverTemp   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
CPU Fault Reboot | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Aux Log          | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
NMI State        | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
ABR Status       | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Firmware Error   | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
PCIs             | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
CPUs             | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
DIMMs            | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Sys Board Fault  | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Power Supply 1   | 0x0        | discrete   | 0x0980| na        | na        | na        | na        | na        | na        
Power Supply 2   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS 1 Fan Fault   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS 2 Fan Fault   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
VT Fault         | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Pwr Rail A Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Pwr Rail B Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Pwr Rail C Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Pwr Rail D Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Pwr Rail E Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS 1 Therm Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS 1 OP Fault    | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS 2 OP Fault    | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS 2 Therm Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS1 12V OV Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS2 12V OV Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS1 12V UV Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS2 12V UV Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS1 12V OC Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS2 12V OC Fault | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS 1 VCO Fault   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
PS 2 VCO Fault   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Power Unit       | 0x0        | discrete   | 0x0280| na        | na        | na        | na        | na        | na        
Cooling Zone 1   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Cooling Zone 2   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Cooling Zone 3   | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
Drive 0          | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Drive 1          | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Drive 2          | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Drive 3          | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
All DIMMS        | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
One of the DIMMs | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
DIMM 1           | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
DIMM 2           | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
DIMM 3           | 0x0        | discrete   | 0x4080| na        | na        | na        | na        | na        | na        
DIMM 4           | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
DIMM 1 Temp      | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
DIMM 2 Temp      | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
DIMM 3 Temp      | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
DIMM 4 Temp      | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
PCI 1            | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
PCI 2            | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
PCI 3            | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
PCI 4            | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
All PCI Error    | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
One of PCI Error | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
IPMI Watchdog    | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Host Power       | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
DASD Backplane 2 | 0x0        | discrete   | 0x0280| na        | na        | na        | na        | na        | na        
DASD Backplane 3 | na         | discrete   | na    | na        | na        | na        | na        | na        | na        
DASD Backplane 4 | na         | discrete   | na    | na        | na        | na        | na        | na        | na        
Backup Memory    | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Progress         | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
Planar Fault     | 0x0        | discrete   | 0x0180| na        | na        | na        | na        | na        | na        
SEL Fullness     | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
PCI 5            | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na        
OS RealTime Mod  | 0x0        | discrete   | 0x0080| na        | na        | na        | na        | na        | na   
```
**alt check sensor**
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
Video USB        | 0x00              | ok
DASD Backplane 1 | 0x00              | ok
SAS Riser        | 0x00              | ok
PCI Riser 1      | 0x00              | ok
PCI Riser 2      | 0x00              | ok
CPU 1            | 0x00              | ok
CPU 2            | 0x00              | ok
All CPUs         | 0x00              | ok
One of The CPUs  | 0x00              | ok
IOH Temp Status  | 0x00              | ok
CPU 1 OverTemp   | 0x00              | ok
CPU 2 OverTemp   | 0x00              | ok
CPU Fault Reboot | 0x00              | ok
Aux Log          | 0x00              | ok
NMI State        | 0x00              | ok
ABR Status       | 0x00              | ok
Firmware Error   | 0x00              | ok
PCIs             | 0x00              | ok
CPUs             | 0x00              | ok
DIMMs            | 0x00              | ok
Sys Board Fault  | 0x00              | ok
Power Supply 1   | 0x00              | ok
Power Supply 2   | 0x00              | ok
PS 1 Fan Fault   | 0x00              | ok
PS 2 Fan Fault   | 0x00              | ok
VT Fault         | 0x00              | ok
Pwr Rail A Fault | 0x00              | ok
Pwr Rail B Fault | 0x00              | ok
Pwr Rail C Fault | 0x00              | ok
Pwr Rail D Fault | 0x00              | ok
Pwr Rail E Fault | 0x00              | ok
PS 1 Therm Fault | 0x00              | ok
PS 1 OP Fault    | 0x00              | ok
PS 2 OP Fault    | 0x00              | ok
PS 2 Therm Fault | 0x00              | ok
PS1 12V OV Fault | 0x00              | ok
PS2 12V OV Fault | 0x00              | ok
PS1 12V UV Fault | 0x00              | ok
PS2 12V UV Fault | 0x00              | ok
PS1 12V OC Fault | 0x00              | ok
PS2 12V OC Fault | 0x00              | ok
PS 1 VCO Fault   | 0x00              | ok
PS 2 VCO Fault   | 0x00              | ok
Power Unit       | 0x00              | ok
Cooling Zone 1   | 0x00              | ok
Cooling Zone 2   | 0x00              | ok
Cooling Zone 3   | 0x00              | ok
Drive 0          | 0x00              | ok
Drive 1          | 0x00              | ok
Drive 2          | 0x00              | ok
Drive 3          | 0x00              | ok
All DIMMS        | 0x00              | ok
One of the DIMMs | 0x00              | ok
DIMM 1           | 0x00              | ok
DIMM 2           | 0x00              | ok
DIMM 3           | 0x00              | ok
DIMM 4           | 0x00              | ok
DIMM 1 Temp      | 0x00              | ok
DIMM 2 Temp      | 0x00              | ok
DIMM 3 Temp      | 0x00              | ok
DIMM 4 Temp      | 0x00              | ok
PCI 1            | 0x00              | ok
PCI 2            | 0x00              | ok
PCI 3            | 0x00              | ok
PCI 4            | 0x00              | ok
All PCI Error    | 0x00              | ok
One of PCI Error | 0x00              | ok
IPMI Watchdog    | 0x00              | ok
Host Power       | 0x00              | ok
DASD Backplane 2 | 0x00              | ok
DASD Backplane 3 | Not Readable      | ns
DASD Backplane 4 | Not Readable      | ns
Backup Memory    | 0x00              | ok
Progress         | 0x00              | ok
Planar Fault     | 0x00              | ok
SEL Fullness     | 0x00              | ok
PCI 5            | 0x00              | ok
OS RealTime Mod  | 0x00              | ok
```
**check status**
```
# ipmitool status | on | off | cycle | reset | diag | soft
```

# IPMI remote access setup
**check current IPMI LAN setup**
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

**set IP address & netmask**
```
# ipmitool lan set 1 ipaddr 192.168.123.123
# ipmitool lan set 1 netmask 255.255.255.0
```

**setup userid & password**
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
**create new userid, set password, and give access**
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
**turn on power**
```
$ ipmitool -H {ip_address} -U {username} -a chassis power on
$ ipmitool -I lanplus -H {ip_address} -U {username} -a chassis power on
```

**print system event log** 
```
$ ipmitool -H {ip_address} -U {username} -a sel list
```

**turn on/off/on for N seconds locator LED**
```
$ ipmitool -H {ip_address} -U {username} -P {password} chassis identify force
$ ipmitool -H {ip_address} -U {username} -P {password} chassis identify 0
$ ipmitool -H {ip_address} -U {username} -P {password} chassis identify {N}
```
