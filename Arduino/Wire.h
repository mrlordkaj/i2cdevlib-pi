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

/* 
 * Author: Thinh Pham
 */

#ifndef TwoWire_h
#define TwoWire_h

#include <cstdint>

#define BUFFER_LENGTH 256

class TwoWire {
private:
    uint8_t addr = 0;
    int fd = 0;
    // read stuff
    uint8_t readBuffer[BUFFER_LENGTH];
    int readAvailable = 0;
    int readOffset = 0;
    // write stuff
    uint8_t writeBuffer[BUFFER_LENGTH];
    int writeOffset = 0;
    
public:
    void begin();
    void begin(uint8_t address);
    void setClock(uint32_t clock);
    void beginTransmission(uint8_t address);
    uint8_t endTransmission(bool sendStop = true);
    size_t write(uint8_t data);
    size_t write(const uint8_t *data, size_t quantity);
    uint8_t requestFrom(uint8_t address, uint8_t quantity, uint32_t iaddress, uint8_t isize, uint8_t sendStop);
    uint8_t requestFrom(uint8_t address, uint8_t quantity, uint8_t sendStop = 1);
    int available();
    int read();
};

extern TwoWire Wire;

#endif /* TwoWire_h */

