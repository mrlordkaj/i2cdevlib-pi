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

// ================================================================
// ===                  ARDUINO PREDEFINITIONS                  ===
// ================================================================

int getArduino() {
    return ARDUINO;
}

// ================================================================
// ===            ARDUINO CORE FUNCTIONS SIMULATION             ===
// ================================================================

long map(long x, long in_min, long in_max, long out_min, long out_max) {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

const int GPIO_TO_WIRINGPI[28] = { 30,31,8,9,7,21,22,11,10,13,12,14,26,23,15,16,27,0,1,24,28,29,3,4,5,6,25,2 };

/**
 * Converts BCM GPIO pin to WiringPi interrupt pin.
 * @see https://pinout.xyz/pinout/wiringpi#
 */
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

static void getLineFromCin(_Serial *serial) {
    std::string line;
    while (serial->inRunning) {
        std::getline(std::cin, line);
        serial->inChars.append(line);
    }
}

void _Serial::begin(int baudrate) {
    if (!inRunning) {
        inRunning = true;
        std::thread inThread(getLineFromCin, this);
        inThread.detach();
    }
}

void _Serial::end() {
    inRunning = false;
}

int _Serial::available() {
    return inChars.length();
}

int _Serial::read() {
    if (inChars.length() > 0) {
        int d = inChars.at(0);
        inChars.erase(0);
        return d;
    }
    return -1;
}

void _Serial::write(char val) {
    std::cout << val << std::flush;
}

void _Serial::print(long val, int format) {
    switch (format) {
        case HEX:
            std::cout << std::hex << std::uppercase << val;
            return;
        case DEC:
            std::cout << std::dec << val;
            return;
        case OCT:
            std::cout << std::oct << val;
            return;
        case BIN:
            std::cout << std::bitset<8>(val);
            return;
    }
}

void _Serial::println(long val, int format) {
    print(val, format);
    std::cout << "\r\n" << std::flush;
}

void _Serial::println() {
    std::cout << "\r\n" << std::flush;
}