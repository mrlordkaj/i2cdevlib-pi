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

#include "AbstractArduino.h"
#include <stdio.h>

long min(long a, long b) {
    return std::min(a, b);
}

long map(long x, long in_min, long in_max, long out_min, long out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

char *dtostrf(double val, signed char width, unsigned char prec, char *sout) {
    char fmt[20];
    sprintf(fmt, "%%%d.%df", width, prec);
    sprintf(sout, fmt, val);
    return sout;
}

void AbstractSerial::write(char c) {
    const char str[] = { c };
    printf(str);
}

void AbstractSerial::print(const char* val) {
    printf(val);
}

void AbstractSerial::print(long val, int format) {
    switch (format) {
        case HEX:
            printf("%X", val);
            return;
        case DEC:
            printf("%d", val);
            return;
        case OCT:
            printf("%o", val);
            return;
        case BIN:
            printf("%b", val);
            return;
    }
}

void AbstractSerial::println(const char* val) {
    printf(val);
    printf("\n");
}

void AbstractSerial::println(long val, int format) {
    print(val, format);
    printf("\n");
}