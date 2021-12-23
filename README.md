# i2cdevlib-pi

The I2C Device Library (i2cdevlib) is a collection of uniform and well-documented classes to provide simple
and intuitive interfaces to I2C devices, made by Jeff Rowberg.

My effort is make a simulation of Arduino to run the library on RaspberryPi without (or minimum) tweaks of his code.
Therefore, we will gain benefits of further update from the original project.

The library only tested on devices I already have. Testing progress are reported at [Supported Devices](#supported-devices) table.
All contribution of coding or testing devices are welcome.

## Copyright

This project inherits [The MIT license](LICENSE) from original project.

Copyright 2012 Jeff Rowberg (i2cdevlib).

Copyright 2019 Thinh Pham (wrapper).

## Installation

### Enable I2C Interface

First of all, must ensure your Pi system has I2C interface enabled, can be done through `raspi-config` tool:
```
$ sudo raspi-config
```
The option to enable I2C interface is under `Interface Options`. You may need reboot your Pi then to apply changes.

### Install Dependencies

The `i2cdevlib-pi` library requires `wiringPi` library as it dependency:
```
$ sudo apt-get update

$ sudo apt-get install wiringpi
```

Some of my visual demos also written on top of `freeglut3`, so if you want to compile them, consider to install this library as well (at your option):
```
$ sudo apt-get install freeglut3-dev -y
```

### Compile and Install

Now you can download and install the `i2cdevlib-pi` library:
```
$ git clone https://github.com/mrlordkaj/i2cdevlib-pi.git

$ cd i2cdevlib-pi

$ sudo make install
```
After `make` process done, the library is ready to link compiler with `-li2cdev`.

## Getting Started

Let's get start with module [MPU6050](MPU6050).

## Build Demos

Most of devices come with various demos. This section guides you to build `MPU6050`'s demos (all other demo can be built by the same way).

Make sure you are working on the root directory of the project, then enter `MPU6050` directory:
```
$ cd MPU6050
```

Head to the [Supported Devices](#supported-devices) table below, you see `MPU6050` device have 3 types of demo, they are `raw`, `dmp6`, and `teapot`.
In example, to build all of them, you just run `make` command with specified name:
```
$ make CONF=raw

$ make CONF=dmp6

$ make CONF=teapot
```

After `make` process all done, your demo application will ready in `demo` directory, you can run it now:
```
$ ./demo/teapot
```

## Supported Devices

| Device | Build Status | Tested | Demos |
| --- | --- | --- | --- |
| AD7746 | Passed | No | - |
| ADS1115 | Passed | No | `single`, `differential` |
| ADXL345 | Passed | No | `raw` |
| AK8963 | Passed | No | - |
| AK8975 | Passed | No | `raw`, `mpu_raw`, `mpu_heading` |
| BMA150 | Passed | No | `raw` |
| BMP085 | Passed | No | `basic` |
| DS1307 | Passed | No | `tick` |
| HMC5843 | Passed | No | `raw` |
| HMC5883L | Passed | No | `raw` |
| HTU21D | Passed | No | `simple` |
| IAQ2000 | Passed | No | `demo` |
| ITG3200 | Passed | No | `raw` |
| L3G4200D | Passed | No | `raw` |
| L3GD20H | Passed | No | `basic` |
| LM73 | Passed | No | - |
| LSM303DLHC | Passed | No | `test` |
| MPR121 | Passed | No | - |
| [MPU6050](MPU6050) | Passed | Yes | `raw`, `dmp6`, `teapot` |
| MPU9150 | Passed | No | `raw` |
| MS5803 | Failed (AVR only) | - | `test` |
| SSD1308 | Passed | No | - |
| TCA6424A | Passed | No | - |
