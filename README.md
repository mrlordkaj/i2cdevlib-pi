# i2cdevlib-pi

This is a forked version of `i2cdevlib`. Which ported in hope to runs smoothly on RaspberryPi devices.
It inherits [The MIT license](LICENSE) from original project.

Copyright 2012 Jeff Rowberg (i2cdevlib).

Copyright 2019 Thinh Pham (wrapper and some of demos).

## What I did

My effort is wrap whole of Jeff Rowberg's `i2cdevlib` from Arduino to run on RaspberryPi without (or minimum) tweaks of his code.
Therefore, we will gain benefits of further update from the original project.
I also made a simulation of Arduino `Serial` on linux `stdio` for easier debugging, and rewritten some of 3D demos.

All contribution of coding or testing device are welcome.

## Installation

### Install Dependencies

First check that wiringPi is not already installed. In a terminal, run:
```
$ gpio -v
```
If you get something, then you have it already installed. Otherwise, you must run:
```
# sudo apt-get install wiringpi
```
That enough for most of our raw and dump demos.
In order to run 3D demos, you need an additional OpenGL library:
```
# sudo apt-get install freeglut3-dev
```

### Build MPU6050 Demos

Clone our source code:
```
$ git clone https://github.com/mrlordkaj/i2cdevlib-pi.git

$ cd i2cdevlib-pi/MPU6050
```
You have 3 types of demostration of your choice:
- `$ make CONF=raw` will builds `raw` demo.
- `$ make CONF=dmp6` will builds `dmp6` demo.
- `$ make CONF=teapot` will builds `teapot` demo.

After `make` process all done. Demo applications will be placed in `demo` directory:
```
$ cd demo
```
Now you can run your demo depends on your built:
- `$ ./raw` displays raw gyro and accel values.
- `$ ./dmp6` displays dump data. Tweak `MPU6050_DMP6.ino` to enable different output data.
- `$ ./teapot` displays a 3D demo application.

## Supported devices
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
| MPU6050 | Passed | Yes | `raw`, `dmp6`, `teapot` |
| MPU9150 | Passed | No | `raw` |
| MS5803 | Failed (AVR only) | - | `test` |
| SSD1308 | Passed | No | - |
| TCA6424A | Passed | No | - |
