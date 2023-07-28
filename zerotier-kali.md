# Zerotier on Kali Linux

* install libssl1.1 deb from Debian Bullseye
* search for package containing libssl.so.1.1
  https://packages.debian.org/search?searchon=contents&keywords=libssl.so.1.1&mode=exactfilename&suite=oldstable&arch=any
  
```
$ wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb11u5_amd64.deb
$ sudo dpkg -i libssl1.1*deb
```

* continue with normal zerotier installation
