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

sudo mkdir -p /usr/local/include/avr
sudo cp Arduino/avr/*.h /usr/local/include/avr
sudo cp Arduino/*.h /usr/local/include

cd dist
sudo mkdir -p /usr/local/include/i2cdevlib
sudo cp include/*.h /usr/local/include/i2cdevlib
sudo cp libi2cdev.so /usr/local/lib/libi2cdev.so
