# i2cdevlib-pi

The I2C Device Library (i2cdevlib) is a collection of uniform and well-documented classes to provide simple
and intuitive interfaces to I2C devices, made by Jeff Rowberg.

My effort is to make this library works on Raspberry Pi devices without minimum tweaks of code.
Therefore, we will gain benefits of further update from the original project.

The library only tested on devices I already have. Testing progress are reported at [Supported Devices](#supported-devices) table.
All contribution of coding or testing devices are welcome.

## Copyright

This project inherits [The MIT license](LICENSE) from original project.

  * Copyright 2012 Gordon Henderson (wiringPi)
  * Copyright 2012 Jeff Rowberg (i2cdevlib)
  * Copyright 2019 Thinh Pham (i2cdevlib-pi)

## Installation

For now as project is under reforging, I recommend you to compile and install from source manually:
```
$ git clone https://github.com/mrlordkaj/i2cdevlib-pi.git

$ cd i2cdevlib-pi

$ make

$ sudo make install
```

## Getting Started

### Wiring Device

Type `pinout` in terminal or go to website [pinout.xyz](https://pinout.xyz/pinout/i2c) to see the pinout map of your Raspberry Pi. Then follow the wiring diagram bellow:

| Raspberry Pi | I2C Device |
| --- | --- |
| 3V3 | VCC |
| GND | GND |
| GPIO3 | SCL |
| GPIO2 | SDA |

### Linking Library

Create [hello.cpp](docs/hello.cpp) source file:
```c++
#include <unistd.h> // standard libs
#include <Arduino.h> // abstract layer

int main() {
    printf("Arduino %d\r\n", getArduino());
    return 0;
}
```

And build it by `g++` tool with linker `-li2cdev`.
```
$ g++ hello.cpp -o hello -li2cdev
```

Compiled program will print out string `Arduino 10812` to your terminal:
```
$ ./hello
```

If everything is correct, you can try to continue with [MPU6050](MPU6050) guide then.

## Build Demos

Most of devices come with various demos. This section guides you how to build `MPU6050` demos (other demos can be built by the same way).

Make sure you are working on the root directory of the project, then enter `MPU6050` directory:
```
$ cd MPU6050
```

Head to the [Supported Devices](#supported-devices) table below, you see MPU6050 module has `raw`, `dmp6`, and `teapot` demos.
In order to build all, run `make` with specified target:
```
$ make CONF=raw

$ make CONF=dmp6

$ make CONF=teapot
```
NOTE: `freeglut3-dev` is required for `teapot` demo.

After `make` processes done, executable demos will available in `dist` directory, try to run it:
```
$ ./dist/teapot
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
| MS5803 | Passed | No | `test` |
| SSD1308 | Passed | No | - |
| TCA6424A | Passed | No | - |
