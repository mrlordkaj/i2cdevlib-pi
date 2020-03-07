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

#include "Arduino.h"
#include "Wire.h"
#include <bitset>
//#include <chrono>
//#include <future>
//#include <string>

// ================================================================
// ===            ARDUINO CORE FUNCTIONS SIMULATION             ===
// ================================================================

long map(long x, long in_min, long in_max, long out_min, long out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

char *dtostrf(double val, signed char width, unsigned char prec, char *sout) {
    char fmt[20];
    sprintf(fmt, "%%%d.%df", width, prec);
    sprintf(sout, fmt, val);
    return sout;
}

const int GPIO_TO_WIRINGPI[28] = { 30,31,8,9,7,21,22,11,10,13,12,14,26,23,15,16,27,0,1,24,28,29,3,4,5,6,25,2 };

int digitalPinToInterrupt(int pin) {
    return GPIO_TO_WIRINGPI[pin];
}

void attachInterrupt(int pin, void (*isr)(void), int mode) {
    wiringPiISR(pin, mode, isr);
}

// ================================================================
// ===                ARDUINO SERIAL SIMULATION                 ===
// ================================================================

_Serial Serial;

void _Serial::begin(int baudrate) {
    // TODO: not implemented yet
    // async stdin: https://gist.github.com/vmrob/ff20420a20c59b5a98a1
}

int _Serial::available() {
    // TODO: not implemented yet
    return 1;
}

int _Serial::read() {
    // TODO: not implemented yet
    return 0;
}

void _Serial::write(char val) {
    std::cout << val << std::flush;
}

void _Serial::print(long val, int format) {
    switch (format) {
        case HEX:
            std::cout << std::hex << val << std::flush;
            return;
        case DEC:
            std::cout << std::dec << val << std::flush;
            return;
        case OCT:
            std::cout << std::oct << val << std::flush;
            return;
        case BIN:
            std::cout << std::bitset<8>(val) << std::flush;
            return;
    }
}

void _Serial::println(long val, int format) {
    print(val, format);
    std::cout << "\r\n" << std::flush;
}

// ================================================================
// ===                 ARDUINO WIRE SIMULATION                  ===
// ================================================================

_Wire Wire;

void _Wire::begin() {
    // TODO: not implemented yet
    // see: wiringPiI2CSetup()
}

void _Wire::setClock(long t) {
    // TODO: not implemented yet
}