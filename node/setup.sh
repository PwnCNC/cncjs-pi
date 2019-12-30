#!/bin/bash

# Retrieve NVM and install
git clone https://github.com/creationix/nvm.git /home/pi/.nvm
cd /home/pi/.nvm
git checkout `git describe --abbrev=0 --tags`
cd /home/pi/
echo "source /home/pi/.nvm/nvm.sh" >> /home/pi/.bashrc
echo "source /home/pi/.nvm/nvm.sh" >> /home/pi/.profile

# Install Node
source /home/pi/.nvm/nvm.sh
nvm install --lts
nvm use --lts
