# i2cdevlib

This is a forked version of `i2cdevlib`. Which ported in hope to runs smoothly on RaspberryPi devices.
It inherited [The MIT license](LICENSE) from original project.

Copyright 2012 Jeff Rowberg (i2cdevlib).

Copyright 2019 Thinh Pham (wrapper and some of demos).

## What I did

My effort is wrap whole Jeff Rowberg's `i2cdevlib` from Arduino to run on RaspberryPi without (or minimum) tweaks of his code.
Beside, I made a simulation of Arduino `Serial` on linux `stdio` for easier debugging and rewritten some of 3D demos.

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
In case you want to see 3D demos, you need an OpenGL library:
```
# sudo apt-get install freeglut3-dev
```

### Build MPU6050 Demos

Clone our source code:
```
$ git clone https://github.com/mrlordkaj/rpi-i2cdevlib.git

$ cd rpi-i2cdevlib/MPU6050
```
Now, we have 3 types of demostration of your choice:
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
