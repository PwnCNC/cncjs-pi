#!/bin/bash

# check for sudo
if [ "$EUID" -ne 0 ];then
  echo "Please run as root"
  exit
fi
cp /home/pi/cncjs-pi/firewall/firewall.conf /etc/firewall.conf
echo "#!/bin/sh" > /etc/network/if-up.d/iptables
echo "iptables-restore < /etc/firewall.conf" >> /etc/network/if-up.d/iptables
chmod +x /etc/network/if-up.d/iptables
