#!/bin/sh

sudo modprobe i2c-dev
if [ -f /dev/i2c-0 ]; then
sudo chmod 666 /dev/i2c-0
fi
if [ -f /dev/i2c-1 ]; then
sudo chmod 666 /dev/i2c-1
fi
sudo apt-get update
sudo apt-get install wiringpi -y
sudo apt-get install freeglut3-dev -y

make
cd dist

sudo cp libi2cdev.so /usr/lib/libi2cdev.so
sudo mkdir -p /usr/include/i2cdevlib
sudo cp include/*.h /usr/include/i2cdevlib
