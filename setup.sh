#!/bin/bash

# check for sudo
if [ "$EUID" -ne 0 ];then
  echo "Please run as root"
  exit
fi

#---------------------------------------------

# validate running on raspberry pi
hwModel="$(cat /proc/device-tree/model)"
if [[ $hwModel != *Raspberry* ]]; then
  echo "This script only supports raspberry pi hardware."
  exit
fi

#---------------------------------------------

## Update/Upgrade OS
apt-get --allow-releaseinfo-change update
apt-get upgrade -y
apt-get autoremove -y
apt-get install vim wget build-essential git -y

#---------------------------------------------

# Install/configure NodeJS
sudo -u pi bash /home/pi/cncjs-pi/node/setup.sh

#---------------------------------------------

# Install CNCJS and PM2
sudo -u pi bash /home/pi/cncjs-pi/cncjs/setup.sh

#---------------------------------------------

# Setup Webcam
sudo bash /home/pi/cncjs-pi/webcam/setup.sh

#---------------------------------------------

# Setup/Configure Firewall
chmod +x /home/pi/cncjs-pi/firewall/setup.sh
chmod +x /home/pi/cncjs-pi/firewall/clear.sh
sudo bash /home/pi/cncjs-pi/firewall/setup.sh

#---------------------------------------------

# Modify the default keyboard
sed -i.bak '/XKBLAYOUT/d' /etc/default/keyboard
echo "XKBLAYOUT=\"us\"" >> /etc/default/keyboard
echo "" >> /etc/default/keyboard

#---------------------------------------------

## Rename device
#hostname $1
#echo $1 > /etc/hostname
#sed -i.bak '/raspberrypi/d' /etc/hosts
#echo "127.0.1.1      $1" >> /etc/hosts

#---------------------------------------------

# Enable/Start SSHd
sudo systemctl enable ssh
sleep 5 && sudo systemctl start ssh

#---------------------------------------------


# Save Cron
crontab -u pi /home/pi/crontab

sudo sed -i -e 's/# cron.*/cron.*     \/var\/log\/cron.log/g' /etc/rsyslog.conf

echo "Setup complete... rebooting"
sleep 5 && sudo shutdown -r now
