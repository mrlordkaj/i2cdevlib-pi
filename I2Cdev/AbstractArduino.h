/*
 * Copyright (C) 2020 Thinh Pham
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/* 
 * Author: Thinh Pham
 */

#ifndef ABSTRACTSERIAL_H
#define ABSTRACTSERIAL_H

#include <wiringPi.h>
#include <stdint.h>
#include <unistd.h>
#include <math.h>
#include <cstring>
#include <algorithm>

#define BUFFER_LENGTH 32
#define PI 3.14159265358979323846
#define HEX 16
#define DEC 10
#define OCT 8
#define BIN 2

long min(long a, long b);
    
long map(long x, long in_min, long in_max, long out_min, long out_max);

char *dtostrf (double val, signed char width, unsigned char prec, char *sout);

class AbstractSerial {
public:
    void write(char c);
    void print(const char* val);
    void print(long val, int format);
    void println(const char* val);
    void println(long val, int format);
};

#endif /* ABSTRACTSERIAL_H */

