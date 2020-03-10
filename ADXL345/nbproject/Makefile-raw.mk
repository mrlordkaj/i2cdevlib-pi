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
CND_CONF=raw
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/d28afab9/Arduino.o \
	${OBJECTDIR}/_ext/d28afab9/Wire.o \
	${OBJECTDIR}/_ext/4ac3ce87/dtostrf.o \
	${OBJECTDIR}/_ext/847938aa/I2Cdev.o \
	${OBJECTDIR}/ADXL345.o \
	${OBJECTDIR}/main.o


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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk demo/${CND_CONF}

demo/${CND_CONF}: ${OBJECTFILES}
	${MKDIR} -p demo
	${LINK.cc} -o demo/${CND_CONF} ${OBJECTFILES} ${LDLIBSOPTIONS} -lwiringPi -lpthread

${OBJECTDIR}/_ext/d28afab9/Arduino.o: ../Arduino/Arduino.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/d28afab9
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DDEMO_RAW -I../Arduino -I../I2Cdev -I. -include ../Arduino/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d28afab9/Arduino.o ../Arduino/Arduino.cpp

${OBJECTDIR}/_ext/d28afab9/Wire.o: ../Arduino/Wire.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/d28afab9
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DDEMO_RAW -I../Arduino -I../I2Cdev -I. -include ../Arduino/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d28afab9/Wire.o ../Arduino/Wire.cpp

${OBJECTDIR}/_ext/4ac3ce87/dtostrf.o: ../Arduino/avr/dtostrf.c
	${MKDIR} -p ${OBJECTDIR}/_ext/4ac3ce87
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/4ac3ce87/dtostrf.o ../Arduino/avr/dtostrf.c

${OBJECTDIR}/_ext/847938aa/I2Cdev.o: ../I2Cdev/I2Cdev.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/847938aa
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DDEMO_RAW -I../Arduino -I../I2Cdev -I. -include ../Arduino/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/847938aa/I2Cdev.o ../I2Cdev/I2Cdev.cpp

${OBJECTDIR}/ADXL345.o: ADXL345.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DDEMO_RAW -I../Arduino -I../I2Cdev -I. -include ../Arduino/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ADXL345.o ADXL345.cpp

${OBJECTDIR}/main.o: main.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DDEMO_RAW -I../Arduino -I../I2Cdev -I. -include ../Arduino/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
