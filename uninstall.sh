#!/bin/sh

cd /usr/local/include/avr
sudo rm *.h

cd /usr/local/include/i2cdevlib
sudo rm *.h

cd /usr/local/include
sudo rm -d avr
sudo rm -d i2cdevlib
sudo rm Arduino.h
sudo rm Wire.h

cd /usr/local/lib
sudo rm libi2cdev.so
