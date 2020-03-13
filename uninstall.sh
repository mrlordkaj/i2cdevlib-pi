#!/bin/sh

cd /usr/include/avr
sudo rm *.h

cd /usr/include/i2cdevlib
sudo rm *.h

cd /usr/include
sudo rm -d avr
sudo rm -d i2cdevlib
sudo rm Arduino.h
sudo rm Wire.h

cd /usr/lib
sudo rm libi2cdev.so
