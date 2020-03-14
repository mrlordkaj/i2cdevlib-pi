#!/bin/sh

sudo modprobe i2c-dev
sudo modprobe i2c-bcm2708
if [ -f /dev/i2c-0 ]; then
sudo chmod 666 /dev/i2c-0
fi
if [ -f /dev/i2c-1 ]; then
sudo chmod 666 /dev/i2c-1
fi

sudo apt-get update
sudo apt-get install wiringpi -y
sudo apt-get install freeglut3-dev -y
make -j2

sudo cp -RT dist/include /usr/include
sudo cp -RT dist/lib /usr/lib
