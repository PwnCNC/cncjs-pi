# CNCjs-Pi

Setting up CNCjs on a Raspberry Pi has a few steps which I've wrapped up in a simple setup script.

Start from a fresh installation of Raspbian Lite; no desktop needed since you'll access the CNCjs interface remotely from another computer.

Log into the pi directly using an attached monitor/keyboard.

download this repo:
`curl https://github.com/PwnCNC/cncjs-pi/archive/master.zip -o cncjs-pi.zip`

unzip it:
`unzip cncjs-pi.zip`

cd into directory
`cd /home/pi/cncjs-pi`

run installation script:
`sudo setup.sh`

