# on build box

From https://www.netnod.se/time-and-frequency/how-to-use-nts

build; don't forget to get conf

    sudo apt install git
    git clone https://gitlab.com/NTPsec/ntpsec.git
    cd ntpsec
    sudo ./buildprep
    ./waf configure
    ./waf build

# test

    sudo ./build/main/ntpd/ntpd -n -d -c ntp.conf

# verify while daemon was run in debug mode

    ./build/main/ntpclients/ntpq -p -u -w

# install

    sudo apt remove ntp ntpsec chrony openntpd
    sudo ./waf install

# run permanently here

    sudo cp ntp.conf /etc
    sudo chown root.root /etc/ntp.conf
    sudo chmod 644 /etc/ntp.conf

# run from /etc/rc.local

    /usr/local/sbin/ntpd

# prepare to distribute

    cd /usr/local
    tar cvf nts-usr-local.tar *

# on target box: buster

    apt install libavahi-compat-libdnssd1 ca-certificates python libpython2.7

# deploy ntp.conf to /etc
# deploy nts-usr-local.tar


