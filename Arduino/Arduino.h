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

#ifndef ARDUINO_H
#define ARDUINO_H

#include <wiringPi.h>
#include <inttypes.h>
#include "avr/pgmspace.h"
#include "avr/dtostrf.h"

#include <iostream>
#include <cmath>
#include <cstring>
#include <thread>
#include <bitset>

// ================================================================
// ===                  ARDUINO PREDEFINITIONS                  ===
// ================================================================

#define ARDUINO 10812 // 1.8.12

#define HEX 16
#define DEC 10
#define OCT 8
#define BIN 2

#define INPUT_PULLUP 0x2

#define PI 3.1415926535897932384626433832795
#define HALF_PI 1.5707963267948966192313216916398
#define TWO_PI 6.283185307179586476925286766559
#define DEG_TO_RAD 0.017453292519943295769236907684886
#define RAD_TO_DEG 57.295779513082320876798154814105
#define EULER 2.718281828459045235360287471352

#define SERIAL  0x0
#define DISPLAY 0x1

#define LSBFIRST 0
#define MSBFIRST 1

#define CHANGE  INT_EDGE_BOTH
#define FALLING INT_EDGE_FALLING
#define RISING  INT_EDGE_RISING

// ================================================================
// ===                ARDUINO MACROS SIMULATION                 ===
// ================================================================

#define min(a,b) ((a)<(b)?(a):(b))
#define max(a,b) ((a)>(b)?(a):(b))
#define abs(x) ((x)>0?(x):-(x))
#define constrain(amt,low,high) ((amt)<(low)?(low):((amt)>(high)?(high):(amt)))
#define round(x)     ((x)>=0?(long)((x)+0.5):(long)((x)-0.5))
#define radians(deg) ((deg)*DEG_TO_RAD)
#define degrees(rad) ((rad)*RAD_TO_DEG)
#define sq(x) ((x)*(x))

long map(long x, long in_min, long in_max, long out_min, long out_max);

int digitalPinToInterrupt(int pin);

void attachInterrupt(int pin, void (*isr)(void), int mode);


// ================================================================
// ===                ARDUINO SERIAL SIMULATION                 ===
// ================================================================

class _Serial {
public:
    // reading stuff
    bool inRunning = false;
    std::string inChars;
    
    void begin(int baudrate);
    void end();
    int available();
    int read();
    void write(char val);
    void print(long val, int format);
    void println(long val, int format);
    void println();
    
    template<typename T> void write(T* val, int count) {
        for (int i = 0; i < count; i++) {
            std::cout << val[i];
        }
        std::cout << std::flush;
    }
    
    template<typename T> void print(T val) {
        std::cout << val;
    };
    
    template<typename T> void println(T val) {
        std::cout << val << "\r\n" << std::flush;
    };
    
    operator bool() { return true; }
};

extern _Serial Serial;

#endif /* ARDUINO_H */

