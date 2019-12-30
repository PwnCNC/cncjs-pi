#!/bin/bash

# check for sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

read -p 'SSID: ' ssid
read -sp 'Password: ' password

# Write the wpa-supplicant configuration file:
echo "
country=US
network={
  ssid=\"$ssid\"
  psk=\"$password\"
}
" >> /etc/wpa_supplicant/wpa_supplicant.conf

# Restart Interface
ifconfig wlan0 down
ifconfig wlan0 up
