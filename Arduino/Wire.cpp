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

#include "Wire.h"
#include <unistd.h>

TwoWire Wire;

ssize_t regWrite(int __fd, const void *__buf, size_t __n) __wur {
    return write(__fd, __buf, __n);
}

ssize_t regRead(int __fd, void *__buf, size_t __nbytes) __wur {
    return read(__fd, __buf, __nbytes);
}

void TwoWire::begin() {
    
}

void TwoWire::begin(uint8_t address) {
    beginTransmission(address);
}

void TwoWire::setClock(uint32_t clock) {
    std::cerr << "Warning: You need set I2C clock in \"/boot/config.txt\" manually.\r\n" << std::flush;
}

void TwoWire::beginTransmission(uint8_t address) {
    if (address != addr) {
        addr = address;
        fd = wiringPiI2CSetup(address);
    }
    readOffset = 0;
    writeOffset = 0;
}

uint8_t TwoWire::endTransmission(bool sendStop) {
    // TODO: sendStop
    int rs = -1;
    if (addr > 0) {
        if (writeOffset > 0) {
            rs = regWrite(fd, &writeBuffer, writeOffset);
        }
        close(fd);
        addr = fd = 0;
    }
    return rs;
}

size_t TwoWire::write(uint8_t data) {
    if (addr > 0) {
        if (writeOffset < BUFFER_LENGTH-1) {
            writeBuffer[writeOffset] = data;
            writeOffset++;
            return 1;
        }
        return 0;
    }
    return -1;
}

size_t TwoWire::write(const uint8_t *data, size_t quantity) {
    if (addr > 0) {
        quantity = min(BUFFER_LENGTH-writeOffset, (int)quantity);
        memcpy(writeBuffer+writeOffset, data, quantity);
        writeOffset += quantity;
        return quantity;
    }
    return -1;
}

uint8_t TwoWire::requestFrom(uint8_t address, uint8_t quantity, uint32_t iaddress, uint8_t isize, uint8_t sendStop) {
    // TODO: iaddress, isize, sendStop
    beginTransmission(address);
    if (addr > 0) {
        readAvailable = regRead(fd, (uint8_t*)&readBuffer, quantity);
        return readAvailable;
    }
    return -1;
}

uint8_t TwoWire::requestFrom(uint8_t address, uint8_t quantity, uint8_t sendStop) {
    return requestFrom((uint8_t)address, (uint8_t)quantity, (uint32_t)0, (uint8_t)0, (uint8_t)sendStop);
}

int TwoWire::available() {
    return readAvailable > 0 ? readAvailable : 0;
}

int TwoWire::read() {
    if (readAvailable > 0) {
        uint8_t d = readBuffer[readOffset];
        readOffset++;
        readAvailable--;
        return d;
    }
    return -1;
}