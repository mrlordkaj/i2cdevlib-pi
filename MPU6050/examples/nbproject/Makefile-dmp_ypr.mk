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
CND_CONF=dmp_ypr
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/80f8d31b/Arduino.o \
	${OBJECTDIR}/_ext/80f8d31b/I2Cdev.o \
	${OBJECTDIR}/_ext/80f8d31b/Wire.o \
	${OBJECTDIR}/_ext/5c0/MPU6050.o \
	${OBJECTDIR}/Main.o


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
LDLIBSOPTIONS=`pkg-config --libs gdkmm-3.0`  

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk /home/pi/MPU6050/${CND_CONF}

/home/pi/MPU6050/${CND_CONF}: ${OBJECTFILES}
	${MKDIR} -p /home/pi/MPU6050
	${LINK.cc} -o /home/pi/MPU6050/${CND_CONF} ${OBJECTFILES} ${LDLIBSOPTIONS} -lwiringPi

${OBJECTDIR}/_ext/80f8d31b/Arduino.o: ../../I2Cdev/Arduino.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/80f8d31b
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DOUTPUT_READABLE_YAWPITCHROLL -I.. -I../../I2Cdev -include Arduino.h `pkg-config --cflags gdkmm-3.0`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/80f8d31b/Arduino.o ../../I2Cdev/Arduino.cpp

${OBJECTDIR}/_ext/80f8d31b/I2Cdev.o: ../../I2Cdev/I2Cdev.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/80f8d31b
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DOUTPUT_READABLE_YAWPITCHROLL -I.. -I../../I2Cdev -include Arduino.h `pkg-config --cflags gdkmm-3.0`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/80f8d31b/I2Cdev.o ../../I2Cdev/I2Cdev.cpp

${OBJECTDIR}/_ext/80f8d31b/Wire.o: ../../I2Cdev/Wire.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/80f8d31b
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DOUTPUT_READABLE_YAWPITCHROLL -I.. -I../../I2Cdev -include Arduino.h `pkg-config --cflags gdkmm-3.0`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/80f8d31b/Wire.o ../../I2Cdev/Wire.cpp

${OBJECTDIR}/_ext/5c0/MPU6050.o: ../MPU6050.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/5c0
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DOUTPUT_READABLE_YAWPITCHROLL -I.. -I../../I2Cdev -include Arduino.h `pkg-config --cflags gdkmm-3.0`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/5c0/MPU6050.o ../MPU6050.cpp

${OBJECTDIR}/Main.o: Main.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DOUTPUT_READABLE_YAWPITCHROLL -I.. -I../../I2Cdev -include Arduino.h `pkg-config --cflags gdkmm-3.0`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Main.o Main.cpp

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
