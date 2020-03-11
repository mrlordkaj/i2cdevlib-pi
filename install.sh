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
make

sudo mkdir -p /usr/local/include/avr
sudo cp Arduino/avr/*.h /usr/local/include/avr
sudo cp Arduino/*.h /usr/local/include

sudo mkdir -p /usr/local/include/i2cdevlib
sudo cp */*.h /usr/local/include/i2cdevlib

sudo cp dist/libi2cdev.a /usr/local/lib/libi2cdev.a
