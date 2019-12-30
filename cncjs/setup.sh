#!/bin/bash

source /home/pi/.nvm/nvm.sh

#---------------------------------------------

# Install CNCJS
npm install -g cncjs@latest --unsafe-perm

#---------------------------------------------

# Install PM2
npm install -g pm2 --unsafe-perm

# Setup PM2 Startup Script
# sudo pm2 startup  # To Start PM2 as root
pm2 startup  # To start PM2 as pi / current user

#[PM2] You have to run this command as root. Execute the following command:
sudo env PATH=$PATH:/usr/bin $(which pm2) startup systemd -u pi --hp /home/pi

# Start CNCjs (on port 8000, /w Tinyweb mount point) with PM2
pm2 start $(which cncjs) -- --port 8000 -m /tinyweb:/home/pi/tinyweb

# Set current running apps to startup
pm2 save
