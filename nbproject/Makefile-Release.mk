#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/AD7746/AD7746.o \
	${OBJECTDIR}/ADS1115/ADS1115.o \
	${OBJECTDIR}/ADXL345/ADXL345.o \
	${OBJECTDIR}/AK8963/AK8963.o \
	${OBJECTDIR}/AK8975/AK8975.o \
	${OBJECTDIR}/Arduino/Arduino.o \
	${OBJECTDIR}/Arduino/Wire.o \
	${OBJECTDIR}/Arduino/avr/dtostrf.o \
	${OBJECTDIR}/Arduino/wiringPi/piHiPri.o \
	${OBJECTDIR}/Arduino/wiringPi/softPwm.o \
	${OBJECTDIR}/Arduino/wiringPi/softTone.o \
	${OBJECTDIR}/Arduino/wiringPi/wiringPi.o \
	${OBJECTDIR}/BMA150/BMA150.o \
	${OBJECTDIR}/BMP085/BMP085.o \
	${OBJECTDIR}/DS1307/DS1307.o \
	${OBJECTDIR}/HMC5843/HMC5843.o \
	${OBJECTDIR}/HMC5883L/HMC5883L.o \
	${OBJECTDIR}/HTU21D/HTU21D.o \
	${OBJECTDIR}/I2Cdev/I2Cdev.o \
	${OBJECTDIR}/IAQ2000/IAQ2000.o \
	${OBJECTDIR}/ITG3200/ITG3200.o \
	${OBJECTDIR}/L3G4200D/L3G4200D.o \
	${OBJECTDIR}/L3GD20H/L3GD20H.o \
	${OBJECTDIR}/LM73/LM73.o \
	${OBJECTDIR}/LSM303DLHC/LSM303DLHC.o \
	${OBJECTDIR}/MPR121/MPR121.o \
	${OBJECTDIR}/MPU6050/MPU6050.o \
	${OBJECTDIR}/MPU9150/MPU9150.o \
	${OBJECTDIR}/MS5803/MS5803.o \
	${OBJECTDIR}/SSD1308/SSD1308.o \
	${OBJECTDIR}/TCA6424A/TCA6424A.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	@"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/libi2cdev.${CND_DLIB_EXT}

${CND_DISTDIR}/libi2cdev.${CND_DLIB_EXT}: ${OBJECTFILES}
	@${MKDIR} -p ${CND_DISTDIR}
	@${LINK.cc} -o ${CND_DISTDIR}/libi2cdev.${CND_DLIB_EXT} ${OBJECTFILES} ${LDLIBSOPTIONS} -pthread -lcrypt -shared -fPIC

${OBJECTDIR}/AD7746/AD7746.o: AD7746/AD7746.cpp
	@echo "AD7746.cpp"
	@${MKDIR} -p ${OBJECTDIR}/AD7746
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/AD7746/AD7746.o AD7746/AD7746.cpp

${OBJECTDIR}/ADS1115/ADS1115.o: ADS1115/ADS1115.cpp
	@echo "ADS1115.cpp"
	@${MKDIR} -p ${OBJECTDIR}/ADS1115
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ADS1115/ADS1115.o ADS1115/ADS1115.cpp

${OBJECTDIR}/ADXL345/ADXL345.o: ADXL345/ADXL345.cpp
	@echo "ADXL345.cpp"
	@${MKDIR} -p ${OBJECTDIR}/ADXL345
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ADXL345/ADXL345.o ADXL345/ADXL345.cpp

${OBJECTDIR}/AK8963/AK8963.o: AK8963/AK8963.cpp
	@echo "AK8963.cpp"
	@${MKDIR} -p ${OBJECTDIR}/AK8963
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/AK8963/AK8963.o AK8963/AK8963.cpp

${OBJECTDIR}/AK8975/AK8975.o: AK8975/AK8975.cpp
	@echo "AK8975.cpp"
	@${MKDIR} -p ${OBJECTDIR}/AK8975
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/AK8975/AK8975.o AK8975/AK8975.cpp

${OBJECTDIR}/Arduino/Arduino.o: Arduino/Arduino.cpp
	@echo "Arduino.cpp"
	@${MKDIR} -p ${OBJECTDIR}/Arduino
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Arduino/Arduino.o Arduino/Arduino.cpp

${OBJECTDIR}/Arduino/Wire.o: Arduino/Wire.cpp
	@echo "Wire.cpp"
	@${MKDIR} -p ${OBJECTDIR}/Arduino
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Arduino/Wire.o Arduino/Wire.cpp

${OBJECTDIR}/Arduino/avr/dtostrf.o: Arduino/avr
	@echo "avr"/dtostrf.c
	@${MKDIR} -p ${OBJECTDIR}/Arduino/avr
	@${RM} "$@.d"
	@$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Arduino/avr/dtostrf.o Arduino/avr/dtostrf.c

${OBJECTDIR}/Arduino/wiringPi/piHiPri.o: Arduino/wiringPi
	@echo "wiringPi"/piHiPri.c
	@${MKDIR} -p ${OBJECTDIR}/Arduino/wiringPi
	@${RM} "$@.d"
	@$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Arduino/wiringPi/piHiPri.o Arduino/wiringPi/piHiPri.c

${OBJECTDIR}/Arduino/wiringPi/softPwm.o: Arduino/wiringPi
	@echo "wiringPi"/softPwm.c
	@${MKDIR} -p ${OBJECTDIR}/Arduino/wiringPi
	@${RM} "$@.d"
	@$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Arduino/wiringPi/softPwm.o Arduino/wiringPi/softPwm.c

${OBJECTDIR}/Arduino/wiringPi/softTone.o: Arduino/wiringPi
	@echo "wiringPi"/softTone.c
	@${MKDIR} -p ${OBJECTDIR}/Arduino/wiringPi
	@${RM} "$@.d"
	@$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Arduino/wiringPi/softTone.o Arduino/wiringPi/softTone.c

${OBJECTDIR}/Arduino/wiringPi/wiringPi.o: Arduino/wiringPi
	@echo "wiringPi"/wiringPi.c
	@${MKDIR} -p ${OBJECTDIR}/Arduino/wiringPi
	@${RM} "$@.d"
	@$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Arduino/wiringPi/wiringPi.o Arduino/wiringPi/wiringPi.c

${OBJECTDIR}/BMA150/BMA150.o: BMA150/BMA150.cpp
	@echo "BMA150.cpp"
	@${MKDIR} -p ${OBJECTDIR}/BMA150
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/BMA150/BMA150.o BMA150/BMA150.cpp

${OBJECTDIR}/BMP085/BMP085.o: BMP085/BMP085.cpp
	@echo "BMP085.cpp"
	@${MKDIR} -p ${OBJECTDIR}/BMP085
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/BMP085/BMP085.o BMP085/BMP085.cpp

${OBJECTDIR}/DS1307/DS1307.o: DS1307/DS1307.cpp
	@echo "DS1307.cpp"
	@${MKDIR} -p ${OBJECTDIR}/DS1307
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/DS1307/DS1307.o DS1307/DS1307.cpp

${OBJECTDIR}/HMC5843/HMC5843.o: HMC5843/HMC5843.cpp
	@echo "HMC5843.cpp"
	@${MKDIR} -p ${OBJECTDIR}/HMC5843
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/HMC5843/HMC5843.o HMC5843/HMC5843.cpp

${OBJECTDIR}/HMC5883L/HMC5883L.o: HMC5883L/HMC5883L.cpp
	@echo "HMC5883L.cpp"
	@${MKDIR} -p ${OBJECTDIR}/HMC5883L
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/HMC5883L/HMC5883L.o HMC5883L/HMC5883L.cpp

${OBJECTDIR}/HTU21D/HTU21D.o: HTU21D/HTU21D.cpp
	@echo "HTU21D.cpp"
	@${MKDIR} -p ${OBJECTDIR}/HTU21D
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/HTU21D/HTU21D.o HTU21D/HTU21D.cpp

${OBJECTDIR}/I2Cdev/I2Cdev.o: I2Cdev/I2Cdev.cpp
	@echo "I2Cdev.cpp"
	@${MKDIR} -p ${OBJECTDIR}/I2Cdev
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/I2Cdev/I2Cdev.o I2Cdev/I2Cdev.cpp

${OBJECTDIR}/IAQ2000/IAQ2000.o: IAQ2000/IAQ2000.cpp
	@echo "IAQ2000.cpp"
	@${MKDIR} -p ${OBJECTDIR}/IAQ2000
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IAQ2000/IAQ2000.o IAQ2000/IAQ2000.cpp

${OBJECTDIR}/ITG3200/ITG3200.o: ITG3200/ITG3200.cpp
	@echo "ITG3200.cpp"
	@${MKDIR} -p ${OBJECTDIR}/ITG3200
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ITG3200/ITG3200.o ITG3200/ITG3200.cpp

${OBJECTDIR}/L3G4200D/L3G4200D.o: L3G4200D/L3G4200D.cpp
	@echo "L3G4200D.cpp"
	@${MKDIR} -p ${OBJECTDIR}/L3G4200D
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/L3G4200D/L3G4200D.o L3G4200D/L3G4200D.cpp

${OBJECTDIR}/L3GD20H/L3GD20H.o: L3GD20H/L3GD20H.cpp
	@echo "L3GD20H.cpp"
	@${MKDIR} -p ${OBJECTDIR}/L3GD20H
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/L3GD20H/L3GD20H.o L3GD20H/L3GD20H.cpp

${OBJECTDIR}/LM73/LM73.o: LM73/LM73.cpp
	@echo "LM73.cpp"
	@${MKDIR} -p ${OBJECTDIR}/LM73
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/LM73/LM73.o LM73/LM73.cpp

${OBJECTDIR}/LSM303DLHC/LSM303DLHC.o: LSM303DLHC/LSM303DLHC.cpp
	@echo "LSM303DLHC.cpp"
	@${MKDIR} -p ${OBJECTDIR}/LSM303DLHC
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/LSM303DLHC/LSM303DLHC.o LSM303DLHC/LSM303DLHC.cpp

${OBJECTDIR}/MPR121/MPR121.o: MPR121/MPR121.cpp
	@echo "MPR121.cpp"
	@${MKDIR} -p ${OBJECTDIR}/MPR121
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MPR121/MPR121.o MPR121/MPR121.cpp

${OBJECTDIR}/MPU6050/MPU6050.o: MPU6050/MPU6050.cpp
	@echo "MPU6050.cpp"
	@${MKDIR} -p ${OBJECTDIR}/MPU6050
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MPU6050/MPU6050.o MPU6050/MPU6050.cpp

${OBJECTDIR}/MPU9150/MPU9150.o: MPU9150/MPU9150.cpp
	@echo "MPU9150.cpp"
	@${MKDIR} -p ${OBJECTDIR}/MPU9150
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MPU9150/MPU9150.o MPU9150/MPU9150.cpp

${OBJECTDIR}/MS5803/MS5803.o: MS5803/MS5803.cpp
	@echo "MS5803.cpp"
	@${MKDIR} -p ${OBJECTDIR}/MS5803
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MS5803/MS5803.o MS5803/MS5803.cpp

${OBJECTDIR}/SSD1308/SSD1308.o: SSD1308/SSD1308.cpp
	@echo "SSD1308.cpp"
	@${MKDIR} -p ${OBJECTDIR}/SSD1308
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SSD1308/SSD1308.o SSD1308/SSD1308.cpp

${OBJECTDIR}/TCA6424A/TCA6424A.o: TCA6424A/TCA6424A.cpp
	@echo "TCA6424A.cpp"
	@${MKDIR} -p ${OBJECTDIR}/TCA6424A
	@${RM} "$@.d"
	@$(COMPILE.cc) -O2 -II2Cdev -IArduino -include Arduino/Arduino.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/TCA6424A/TCA6424A.o TCA6424A/TCA6424A.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	@${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
