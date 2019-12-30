#!/bin/bash

# check for sudo
if [ "$EUID" -ne 0 ];then
  echo "Please run as root"
  exit
fi

# Clear all ipv4 rules
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X

# Clear all ipv6 rules
ip6tables -P INPUT ACCEPT
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT
ip6tables -t nat -F
ip6tables -t mangle -F
ip6tables -F
ip6tables -X
