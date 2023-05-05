VirtualBox bridging does not allow hosts on the same bridge to communicate properly with VBox's VM Guest. Workaround is to use tap interface.

Ref: https://serverfault.com/questions/556747/reach-lxc-container-from-a-virtualbox-guest-on-the-same-host

# Manual Setup

    # ip tuntap add mode tap tap0
    # ip link set tap0 up
    # brctl addif lxcbr0 tap0 
    
then use interface tap0 on VBox

# Permanent Config using interfaces (Debian, Ubuntu, etc)

    iface eth1 inet manual

    auto lxcbr0
    iface lxcbr0 inet static
	    bridge_ports eth1 
	    bridge_fd 0
	    address a.a.a.a/24
	    gateway g.g.g.g

    auto tap0
    iface tap0 inet static
	    address 0.0.0.0/0
	    pre-up ip tuntap add mode tap tap0
	    up brctl addif lxcbr0 tap0
