#!/bin/sh
#
# The MIT License
#
# Copyright 2020 Thinh Pham.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

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

sudo cp -RT dist/include /usr/include
sudo cp -RT dist/lib /usr/lib
