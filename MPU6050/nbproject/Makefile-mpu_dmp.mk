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
CND_CONF=mpu_dmp
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/847938aa/Arduino.o \
	${OBJECTDIR}/_ext/847938aa/I2Cdev.o \
	${OBJECTDIR}/_ext/847938aa/Wire.o \
	${OBJECTDIR}/MPU6050.o \
	${OBJECTDIR}/Main.o \
	${OBJECTDIR}/Teapot.o


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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk /home/pi/MPU6050/${CND_CONF}

/home/pi/MPU6050/${CND_CONF}: ${OBJECTFILES}
	${MKDIR} -p /home/pi/MPU6050
	${LINK.cc} -o /home/pi/MPU6050/${CND_CONF} ${OBJECTFILES} ${LDLIBSOPTIONS} -lwiringPi -lpthread

${OBJECTDIR}/_ext/847938aa/Arduino.o: ../I2Cdev/Arduino.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/847938aa
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DMPU6050_DMP6 -I../I2Cdev -I. -include ../I2Cdev/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/847938aa/Arduino.o ../I2Cdev/Arduino.cpp

${OBJECTDIR}/_ext/847938aa/I2Cdev.o: ../I2Cdev/I2Cdev.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/847938aa
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DMPU6050_DMP6 -I../I2Cdev -I. -include ../I2Cdev/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/847938aa/I2Cdev.o ../I2Cdev/I2Cdev.cpp

${OBJECTDIR}/_ext/847938aa/Wire.o: ../I2Cdev/Wire.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/847938aa
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DMPU6050_DMP6 -I../I2Cdev -I. -include ../I2Cdev/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/847938aa/Wire.o ../I2Cdev/Wire.cpp

${OBJECTDIR}/MPU6050.o: MPU6050.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DMPU6050_DMP6 -I../I2Cdev -I. -include ../I2Cdev/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MPU6050.o MPU6050.cpp

${OBJECTDIR}/Main.o: Main.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DMPU6050_DMP6 -I../I2Cdev -I. -include ../I2Cdev/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Main.o Main.cpp

${OBJECTDIR}/Teapot.o: Teapot.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DMPU6050_DMP6 -I../I2Cdev -I. -include ../I2Cdev/Arduino.h -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Teapot.o Teapot.cpp

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
