# CNCjs-Pi

Setting up CNCjs on a Raspberry Pi has a few steps which I've wrapped up in a simple setup script.

Start from a fresh installation of Raspbian Lite; no desktop needed since you'll access the CNCjs interface remotely from another computer.

Log into the pi directly using an attached monitor/keyboard.

download this repo:
`curl -LJ https://github.com/PwnCNC/cncjs-pi/tarball/master -o cncjs-pi.tar.gz`

Untar file:
`tar xvf cncjs-pi.tar.gz`

Rename directory... this is where you'll need to run `ls` to see what the dir name is...
in my case, it untarred as `PwnCNC-cncjs-pi-efa0692`, your directory may have a different trailing chars so rename it... `mv PwnCNC-cncjs-pi-efa0692 cncjs-pi`

then cd into that directory
`cd /home/pi/cncjs-pi`

run installation script:
`sudo ./setup.sh`

