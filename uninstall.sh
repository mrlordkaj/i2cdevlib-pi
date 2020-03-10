#!/bin/sh

cd /usr/local/include/avr
sudo rm *.h

cd /usr/local/include
sudo rm -d avr
sudo rm Arduino.h
sudo rm Wire.h

cd /usr/local/lib
sudo rm libi2cdev.a
