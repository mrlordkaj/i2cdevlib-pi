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

sudo mkdir -p /usr/local/include/i2cdevlib
sudo cp I2Cdev/I2Cdev.h /usr/local/include/i2cdevlib
sudo cp AD7746/AD7746.h /usr/local/include/i2cdevlib
sudo cp ADS1115/ADS1115.h /usr/local/include/i2cdevlib
sudo cp ADXL345/ADXL345.h /usr/local/include/i2cdevlib
sudo cp AK8963/AK8963.h /usr/local/include/i2cdevlib
sudo cp AK8975/AK8975.h /usr/local/include/i2cdevlib
sudo cp BMA150/BMA150.h /usr/local/include/i2cdevlib
sudo cp BMP085/BMP085.h /usr/local/include/i2cdevlib
sudo cp DS1307/DS1307.h /usr/local/include/i2cdevlib
sudo cp HMC5843/HMC5843.h /usr/local/include/i2cdevlib
sudo cp HMC5883L/HMC5883L.h /usr/local/include/i2cdevlib
sudo cp HTU21D/HTU21D.h /usr/local/include/i2cdevlib
sudo cp IAQ2000/IAQ2000.h /usr/local/include/i2cdevlib
sudo cp ITG3200/ITG3200.h /usr/local/include/i2cdevlib
sudo cp L3G4200D/L3G4200D.h /usr/local/include/i2cdevlib
sudo cp L3GD20H/L3GD20H.h /usr/local/include/i2cdevlib
sudo cp LM73/LM73.h /usr/local/include/i2cdevlib
sudo cp LSM303DLHC/LSM303DLHC.h /usr/local/include/i2cdevlib
sudo cp MPR121/MPR121.h /usr/local/include/i2cdevlib
sudo cp MPU6050/MPU6050.h /usr/local/include/i2cdevlib
sudo cp MPU9150/MPU9150.h /usr/local/include/i2cdevlib
sudo cp MS5803/MS5803_I2C.h /usr/local/include/i2cdevlib
sudo cp SSD1308/SSD1308.h /usr/local/include/i2cdevlib
sudo cp TCA6424A/TCA6424A.h /usr/local/include/i2cdevlib
sudo cp dist/libi2cdev.a /usr/local/lib/libi2cdev.a
