/*
 * The MIT License
 *
 * Copyright 2020 Thinh Pham.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/i2c-dev.h>
#include <wiringPi.h>
#include <unistd.h>
#include "Wire.h"

TwoWire Wire;

static inline ssize_t i2cWrite(int __fd, const void *__buf, size_t __n) __wur {
    return write(__fd, __buf, __n);
}

static inline ssize_t i2cRead(int __fd, void *__buf, size_t __nbytes) __wur {
    return read(__fd, __buf, __nbytes);
}

void TwoWire::begin() {
    if (fd < 0) {
        int rev = piGpioLayout();
        const char *device = (rev == 1) ? "/dev/i2c-0" : "/dev/i2c-1";
        if ((fd = open(device, O_RDWR)) < 0) {
            std::cerr << "Failed to open I2C port: " << strerror(errno) << "\r\n" << std::flush;
        }
    }
}

void TwoWire::begin(uint8_t address) {
    begin();
    if (address != addr) {
        addr = address;
        if (fd < 0 || ioctl(fd, I2C_SLAVE, address) < 0) {
            std::cerr << "Failed to open I2C device: " << strerror(errno) << "\r\n" << std::flush;
            addr = 0;
        }
    }
}

void TwoWire::begin(int address) {
    begin((uint8_t)address);
}

void TwoWire::end() {
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    addr = 0;
}

void TwoWire::setClock(uint32_t clock) {
    std::cerr << "Warning: You need set I2C clock manually.\r\n" << std::flush;
}

void TwoWire::beginTransmission(uint8_t address) {
    begin(address);
    readOffset = 0;
    writeOffset = 0;
}

void TwoWire::beginTransmission(int address) {
    beginTransmission((uint8_t)address);
}

/**
 * Sends written buffer to the bus.
 * @return  0 .. success
 *          1 .. buffer too long
 *          2 .. address send, NACK received
 *          3 .. data send, NACK received
 *          4 .. other error
 */
uint8_t TwoWire::endTransmission(bool sendStop) {
    // TODO: sendStop
    if (addr > 0 && fd >= 0) {
        if (writeOffset > 0) {
            int written = i2cWrite(fd, &writeBuffer, writeOffset);
            if (written < 0) {
                return 2; // address send, NACK received
            } else if (written < writeOffset) {
                return 3; // data send, NACK received
            }
        }
        return 0; // success
    }
    return 4; // other error
}

uint8_t TwoWire::endTransmission() {
    return endTransmission(true);
}

size_t TwoWire::write(const uint8_t *data, size_t quantity) {
    if (addr > 0) {
        quantity = min(BUFFER_LENGTH-writeOffset, (int)quantity);
        if (quantity > 0) {
            memcpy(writeBuffer+writeOffset, data, quantity);
            writeOffset += quantity;
            return quantity;
        }
        return 0;
    }
    return -1;
}

size_t TwoWire::write(uint8_t data) {
    return write(&data, 1);
}

/**
 * Reads data from the bus to buffer.
 * @return read length or -1.
 */
uint8_t TwoWire::requestFrom(uint8_t address, uint8_t quantity, uint32_t iaddress, uint8_t isize, uint8_t sendStop) {
    // TODO: sendStop
    
    if (isize > 0) {
        // send internal address
        beginTransmission(address);
        // the maximum size of internal address is 3 bytes
        if (isize > 3){
            isize = 3;
        }
        // write internal register address - most significant byte first
        while (isize-- > 0)
            write((uint8_t)(iaddress >> (isize*8)));
        endTransmission(false);
    }
    
    // send data
    beginTransmission(address);
    if (addr > 0) {
        if (quantity > BUFFER_LENGTH) {
            // clamp to buffer length
            quantity = BUFFER_LENGTH;
        }
        readAvailable = i2cRead(fd, (uint8_t*)&readBuffer, quantity);
        return readAvailable;
    }
    return -1;
}

uint8_t TwoWire::requestFrom(uint8_t address, uint8_t quantity, uint8_t sendStop) {
    return requestFrom((uint8_t)address, (uint8_t)quantity, (uint32_t)0, (uint8_t)0, (uint8_t)sendStop);
}

uint8_t TwoWire::requestFrom(uint8_t address, uint8_t quantity) {
    return requestFrom((uint8_t)address, (uint8_t)quantity, (uint8_t)true);
}

uint8_t TwoWire::requestFrom(int address, int quantity) {
    return requestFrom((uint8_t)address, (uint8_t)quantity, (uint8_t)true);
}

uint8_t TwoWire::requestFrom(int address, int quantity, int sendStop) {
    return requestFrom((uint8_t)address, (uint8_t)quantity, (uint8_t)sendStop);
}

/**
 * Gets data length available to read.
 */
int TwoWire::available() {
    return readAvailable > 0 ? readAvailable : 0;
}

/**
 * Reads next byte in buffer.
 * @return next byte value or -1.
 */
int TwoWire::read() {
    if (readAvailable > 0) {
        uint8_t d = readBuffer[readOffset];
        readOffset++;
        readAvailable--;
        return d;
    }
    return -1;
}

/**
 * Reads next byte in buffer but not increase index.
 * @return next byte value or -1.
 */
int TwoWire::peek() {
    if (readAvailable > 0) {
        return readBuffer[readOffset];
    }
    return -1;
}

void TwoWire::flush() {
    // XXX: to be implemented.
}