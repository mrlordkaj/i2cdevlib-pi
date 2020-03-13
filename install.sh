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

sudo mkdir -p /usr/include/avr
sudo cp Arduino/avr/*.h /usr/include/avr
sudo cp Arduino/*.h /usr/include

sudo mkdir -p /usr/include/i2cdevlib
sudo cp I2Cdev/I2Cdev.h /usr/include/i2cdevlib
sudo cp AD7746/AD7746.h /usr/include/i2cdevlib
sudo cp ADS1115/ADS1115.h /usr/include/i2cdevlib
sudo cp ADXL345/ADXL345.h /usr/include/i2cdevlib
sudo cp AK8963/AK8963.h /usr/include/i2cdevlib
sudo cp AK8975/AK8975.h /usr/include/i2cdevlib
sudo cp BMA150/BMA150.h /usr/include/i2cdevlib
sudo cp BMP085/BMP085.h /usr/include/i2cdevlib
sudo cp DS1307/DS1307.h /usr/include/i2cdevlib
sudo cp HMC5843/HMC5843.h /usr/include/i2cdevlib
sudo cp HMC5883L/HMC5883L.h /usr/include/i2cdevlib
sudo cp HTU21D/HTU21D.h /usr/include/i2cdevlib
sudo cp IAQ2000/IAQ2000.h /usr/include/i2cdevlib
sudo cp ITG3200/ITG3200.h /usr/include/i2cdevlib
sudo cp L3G4200D/L3G4200D.h /usr/include/i2cdevlib
sudo cp L3GD20H/L3GD20H.h /usr/include/i2cdevlib
sudo cp LM73/LM73.h /usr/include/i2cdevlib
sudo cp LSM303DLHC/LSM303DLHC.h /usr/include/i2cdevlib
sudo cp MPR121/MPR121.h /usr/include/i2cdevlib
sudo cp MPU6050/MPU6050.h /usr/include/i2cdevlib
sudo cp MPU9150/MPU9150.h /usr/include/i2cdevlib
#sudo cp MS5803/MS5803_I2C.h /usr/include/i2cdevlib
sudo cp SSD1308/SSD1308.h /usr/include/i2cdevlib
sudo cp TCA6424A/TCA6424A.h /usr/include/i2cdevlib

sudo cp dist/libi2cdev.so /usr/lib/libi2cdev.so
