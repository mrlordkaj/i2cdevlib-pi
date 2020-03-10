# i2cdevlib-pi

This is a forked version of `i2cdevlib`. Which ported in hope to runs smoothly on RaspberryPi devices.
It inherits [The MIT license](LICENSE) from original project.

Copyright 2012 Jeff Rowberg (i2cdevlib).

Copyright 2019 Thinh Pham (wrapper and some of demos).

## What I did

My effort is wrap whole of Jeff Rowberg's `i2cdevlib` from Arduino to run on RaspberryPi without (or minimum) tweaks of his code.
Therefore, we will gain benefits of further update from the original project.

I also made a simulation of Arduino `Serial` on linux `stdio` for easier debugging, and rewritten some of 3D demos.

I only tested on my devices. The testing progress are reported at [Supported Devices](#supported-devices) table. All contribution of coding or testing devices are welcome.

## Installation

Since I made an install bash script, you simply run it to install.

Clone our source code then install it:
```
$ git clone https://github.com/mrlordkaj/i2cdevlib-pi.git

$ cd i2cdevlib-pi

$ sudo chmod +x install.sh

$ ./install.sh
```
After script process all done, you can use the library with your linker `-li2cdev`.

## Build Demos

Most of raw and dump demos does not need any addition dependencies. But, in order to build 3D application, you need an additional library:
```
$ sudo apt-get update

$ sudo apt-get install freeglut3-dev
```

We have many of demostrations depends on each device. Here, I guide you to build `MPU6050`'s demos (all other demo can be built by the same way).

First, make sure you are working on the root directory of the project.

Then, enter `MPU6050` directory:
```
$ cd MPU6050
```

Refer to the [Supported Devices](#supported-devices) table below, you will see the `MPU6050` have 3 types of demo, they are `raw`, `dmp6`, and `teapot`. In example, to build all of them, you just run `make` command with specified demo name:
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
| MPU6050 | Passed | Yes | `raw`, `dmp6`, `teapot` |
| MPU9150 | Passed | No | `raw` |
| MS5803 | Failed (AVR only) | - | `test` |
| SSD1308 | Passed | No | - |
| TCA6424A | Passed | No | - |
