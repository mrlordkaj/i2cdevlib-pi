# i2cdevlib-pi

This is a forked version of `i2cdevlib`. Which ported in hope to runs smoothly on RaspberryPi devices.
It inherits [The MIT license](LICENSE) from original project.

Copyright 2012 Jeff Rowberg (i2cdevlib).

Copyright 2019 Thinh Pham (wrapper and some of demos).

## What I did

My effort is wrap whole Jeff Rowberg's `i2cdevlib` from Arduino to run on RaspberryPi without (or minimum) tweaks of his code.
Therefore, we will gain benefits of further update from original project.
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
- `$ make CONF=mpu_raw` will builds `mpu_raw` demo.
- `$ make CONF=mpu_dmp` will builds `mpu_dmp` demo.
- `$ make CONF=mpu_teapot` will builds `mpu_teapot` demo.

After `make` process all done. Demo applications will be placed in `dist` directory:
```
$ cd dist
```
Now you can run your demo depends on your built:
- `$ ./mpu_raw` displays raw gyro and accel values.
- `$ ./mpu_dmp` displays dump data. Tweak `MPU6050_DMP6.ino` to enable different output data.
- `$ ./mpu_teapot` displays a 3D demo application.

## Supported devices
| Device | Code Status | Tested | Demos |
| --- | --- | --- | --- |
| AD7746 | Completed | No | - |
| ADS1115 | Completed, Future Development Planned | No | - |
| ADXL345 | Completed | No | - |
| AK8975 | Completed | No | - |
| BMA150 | Initial Development In Progress | No | - |
| BMP085 | Initial Development In Progress | No | - |
| DS1307 | Completed | No | - |
| HMC5843 | Completed | No | - |
| HMC5883L | Completed | No | - |
| iAQ-2000 | Completed | No | - |
| IQS156 | - | No | - |
| ITG-3200 | Completed | No | - |
| L3G4200D | - | No | - |
| MPL3115A2 | Requested | No | - |
| MPR121 | Initial Development In Progress | No | - |
| MPU-6050 | New Feature Development In Progress | Yes | `mpu_raw`, `mpu_dmp`, `mpu_teapot` |
| MPU-9150 | New Feature Development In Progress | No | - |
| PanelPilot | Planned | No | - |
| SSD1308 | Initial Development In Progress | No | - |
| TCA6424A | Bug Fix Development In Progress | No | - |
