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
	${OBJECTDIR}/_ext/64e570a/I2Cdev.o \
	${OBJECTDIR}/_ext/29dd86f/MPU6050.o \
	${OBJECTDIR}/demo_raw.o


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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk /home/pi/demo_raw

/home/pi/demo_raw: ${OBJECTFILES}
	${MKDIR} -p /home/pi
	${LINK.cc} -o /home/pi/demo_raw ${OBJECTFILES} ${LDLIBSOPTIONS} -lwiringPi

${OBJECTDIR}/_ext/64e570a/I2Cdev.o: ../../../I2Cdev/I2Cdev.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/64e570a
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DWIRING_PI -I../.. -I../../../I2Cdev -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/64e570a/I2Cdev.o ../../../I2Cdev/I2Cdev.cpp

${OBJECTDIR}/_ext/29dd86f/MPU6050.o: ../../MPU6050.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/29dd86f
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DWIRING_PI -I../.. -I../../../I2Cdev -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/29dd86f/MPU6050.o ../../MPU6050.cpp

${OBJECTDIR}/demo_raw.o: demo_raw.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DWIRING_PI -I../.. -I../../../I2Cdev -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/demo_raw.o demo_raw.cpp

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
