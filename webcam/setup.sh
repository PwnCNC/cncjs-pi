#!/bin/bash

# check for sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Update & Install Tools
sudo apt-get install build-essential libjpeg8-dev imagemagick libv4l-dev cmake -y

# Clone Repo in /tmp
cd /tmp
git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental

# Make
make
make install

# Run
#/usr/local/bin/mjpg_streamer -i "input_uvc.so -r 1280x720 -d /dev/video0 -f 30 -q 80" -o "output_http.so -p 8080 -w /usr/local/share/mjpg-streamer/www"

# Make Executable
chmod +x /home/pi/cncjs-pi/webcam/mjpg-streamer.sh

# Add to crontab for startup
echo "@reboot /home/pi/cncjs-pi/webcam/mjpg-streamer.sh start" >> /home/pi/crontab
#crontab -u pi /home/pi/crontab
