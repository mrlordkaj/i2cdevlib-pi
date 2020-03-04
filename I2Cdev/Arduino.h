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

#ifndef ARDUINO_H
#define ARDUINO_H

#include <wiringPi.h>
#include <stdint.h>
#include <unistd.h>
#include <iostream>
#include <math.h>
#include <cstring>
#include <algorithm>
#include <inttypes.h>

// ================================================================
// ===                  ARDUINO PREDEFINATIONS                  ===
// ================================================================

#define BUFFER_LENGTH 32
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

#define CHANGE 1
#define FALLING 2
#define RISING 3

//#if defined(__AVR_ATtiny24__) || defined(__AVR_ATtiny44__) || defined(__AVR_ATtiny84__)
//  #define DEFAULT 0
//  #define EXTERNAL 1
//  #define INTERNAL1V1 2
//  #define INTERNAL INTERNAL1V1
//#elif defined(__AVR_ATtiny25__) || defined(__AVR_ATtiny45__) || defined(__AVR_ATtiny85__)
//  #define DEFAULT 0
//  #define EXTERNAL 4
//  #define INTERNAL1V1 8
//  #define INTERNAL INTERNAL1V1
//  #define INTERNAL2V56 9
//  #define INTERNAL2V56_EXTCAP 13
//#else  
//#if defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__) || defined(__AVR_ATmega1284__) || defined(__AVR_ATmega1284P__) || defined(__AVR_ATmega644__) || defined(__AVR_ATmega644A__) || defined(__AVR_ATmega644P__) || defined(__AVR_ATmega644PA__)
//#define INTERNAL1V1 2
//#define INTERNAL2V56 3
//#else
//#define INTERNAL 3
//#endif
//#define DEFAULT 1
//#define EXTERNAL 0
//#endif
//
//// undefine stdlib's abs if encountered
//#ifdef abs
//#undef abs
//#endif

//#define abs(x) ((x)>0?(x):-(x))
//#define constrain(amt,low,high) ((amt)<(low)?(low):((amt)>(high)?(high):(amt)))
//#define round(x)     ((x)>=0?(long)((x)+0.5):(long)((x)-0.5))
//#define radians(deg) ((deg)*DEG_TO_RAD)
//#define degrees(rad) ((rad)*RAD_TO_DEG)
//#define sq(x) ((x)*(x))

// Tom Carpenter's conditional PROGMEM code
// http://forum.arduino.cc/index.php?topic=129407.0
#ifdef __AVR__
    #include <avr/pgmspace.h>
#else
// Teensy 3.0 library conditional PROGMEM code from Paul Stoffregen
#ifndef __PGMSPACE_H_
#define __PGMSPACE_H_
#define PROGMEM
#define PGM_P  const char *
#define PSTR(str) (str)
#define F(x) x

typedef void prog_void;
typedef char prog_char;
typedef unsigned char prog_uchar;
typedef int8_t prog_int8_t;
typedef uint8_t prog_uint8_t;
typedef int16_t prog_int16_t;
typedef uint16_t prog_uint16_t;
typedef int32_t prog_int32_t;
typedef uint32_t prog_uint32_t;

#define strcpy_P(dest, src) strcpy((dest), (src))
#define strcat_P(dest, src) strcat((dest), (src))
#define strcmp_P(a, b) strcmp((a), (b))

#define pgm_read_byte(addr) (*(const unsigned char *)(addr))
#define pgm_read_word(addr) (*(const unsigned short *)(addr))
#define pgm_read_dword(addr) (*(const unsigned long *)(addr))
#define pgm_read_float(addr) (*(const float *)(addr))

#define pgm_read_byte_near(addr) pgm_read_byte(addr)
#define pgm_read_word_near(addr) pgm_read_word(addr)
#define pgm_read_dword_near(addr) pgm_read_dword(addr)
#define pgm_read_float_near(addr) pgm_read_float(addr)
#define pgm_read_byte_far(addr) pgm_read_byte(addr)
#define pgm_read_word_far(addr) pgm_read_word(addr)
#define pgm_read_dword_far(addr) pgm_read_dword(addr)
#define pgm_read_float_far(addr) pgm_read_float(addr)
#endif /* __PGMSPACE_H_ */
#endif /* __AVR__ */

// ================================================================
// ===            ARDUINO CORE FUNCTIONS SIMULATION             ===
// ================================================================

template<typename T> T min(T a, T b) {
    return a < b ? a : b;
}

template<typename T> T max(T a, T b) {
    return a > b ? a : b;
}
    
long map(long x, long in_min, long in_max, long out_min, long out_max);

char *dtostrf (double val, signed char width, unsigned char prec, char *sout);

// ================================================================
// ===                ARDUINO SERIAL SIMULATION                 ===
// ================================================================

class _Serial {
public:
    void begin(int baudrate);
    void write(char val);
    void print(long val, int format);
    void println(long val, int format);
    
    template<typename T> void print(T val) {
        std::cout << val;
    };
    
    template<typename T> void println(T val) {
        std::cout << val << "\r\n";
    };
};

extern _Serial Serial;

#endif /* ARDUINO_H */

