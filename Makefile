#
# The MIT License
#
# Copyright 2020 Thinh Pham.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#
#  There exist several targets which are by default empty and which can be 
#  used for execution of your targets. These targets are usually executed 
#  before and after some main targets. They are: 
#
#     .build-pre:              called before 'build' target
#     .build-post:             called after 'build' target
#     .clean-pre:              called before 'clean' target
#     .clean-post:             called after 'clean' target
#     .clobber-pre:            called before 'clobber' target
#     .clobber-post:           called after 'clobber' target
#     .all-pre:                called before 'all' target
#     .all-post:               called after 'all' target
#     .help-pre:               called before 'help' target
#     .help-post:              called after 'help' target
#
#  Targets beginning with '.' are not intended to be called on their own.
#
#  Main targets can be executed directly, and they are:
#  
#     build                    build a specific configuration
#     clean                    remove built files from a configuration
#     clobber                  remove all built files
#     all                      build all configurations
#     help                     print help mesage
#  
#  Targets .build-impl, .clean-impl, .clobber-impl, .all-impl, and
#  .help-impl are implemented in nbproject/makefile-impl.mk.
#
#  Available make variables:
#
#     CND_BASEDIR                base directory for relative paths
#     CND_DISTDIR                default top distribution directory (build artifacts)
#     CND_BUILDDIR               default top build directory (object files, ...)
#     CONF                       name of current configuration
#     CND_PLATFORM_${CONF}       platform name (current configuration)
#     CND_ARTIFACT_DIR_${CONF}   directory of build artifact (current configuration)
#     CND_ARTIFACT_NAME_${CONF}  name of build artifact (current configuration)
#     CND_ARTIFACT_PATH_${CONF}  path to build artifact (current configuration)
#     CND_PACKAGE_DIR_${CONF}    directory of package (current configuration)
#     CND_PACKAGE_NAME_${CONF}   name of package (current configuration)
#     CND_PACKAGE_PATH_${CONF}   path to package (current configuration)
#
# NOCDDL


# Environment 
MKDIR=mkdir
CP=cp
CCADMIN=CCadmin
CND_INSTALL_DIR=/usr


# build
build: .build-post

.build-pre:
	@echo "Compiling sources..."
	
.build-post: .build-impl
	
	
# install
install: .install-pre .build-post
	@echo "Installing i2cdevlib..."
	@[ -d ${CND_INSTALL_DIR}/include ] || mkdir ${CND_INSTALL_DIR}/include
	@cp Arduino/*.h ${CND_INSTALL_DIR}/include
	
	@[ -d ${CND_INSTALL_DIR}/include/avr ] || mkdir ${CND_INSTALL_DIR}/include/avr
	@cp Arduino/avr/*.h ${CND_INSTALL_DIR}/include/avr
	
	@[ -d ${CND_INSTALL_DIR}/include/i2cdevlib ] || mkdir ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp I2Cdev/I2Cdev.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp AD7746/AD7746.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp ADS1115/ADS1115.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp ADXL345/ADXL345.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp AK8963/AK8963.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp AK8975/AK8975.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp BMA150/BMA150.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp BMP085/BMP085.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp DS1307/DS1307.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp HMC5843/HMC5843.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp HMC5883L/HMC5883L.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp HTU21D/HTU21D.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp IAQ2000/IAQ2000.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp ITG3200/ITG3200.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp L3G4200D/L3G4200D.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp L3GD20H/L3GD20H.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp LM73/LM73.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp LSM303DLHC/LSM303DLHC.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp MPR121/MPR121.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp MPU6050/MPU6050.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp MPU9150/MPU9150.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@#cp MS5803/MS5803_I2C.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp SSD1308/SSD1308.h ${CND_INSTALL_DIR}/include/i2cdevlib
	@cp TCA6424A/TCA6424A.h ${CND_INSTALL_DIR}/include/i2cdevlib
	
	@mv ${CND_DISTDIR}/libi2cdev.so ${CND_INSTALL_DIR}/lib/libi2cdev.so
	
.install-pre:
	@echo "Enabling I2C supports..."
	@modprobe i2c-dev
	@modprobe i2c-bcm2708
	@if [ -f /dev/i2c-0 ]; then chmod 666 /dev/i2c-0; fi
	@if [ -f /dev/i2c-1 ]; then chmod 666 /dev/i2c-1; fi
	
	
# uninstall
uninstall:
	@echo "Uninstalling i2cdevlib..."
	@rm -r ${CND_INSTALL_DIR}/include/avr
	@rm -r ${CND_INSTALL_DIR}/include/i2cdevlib
	@rm ${CND_INSTALL_DIR}/include/Arduino.h
	@rm ${CND_INSTALL_DIR}/include/Wire.h
	@rm ${CND_INSTALL_DIR}/lib/libi2cdev.so

# clean
clean: .clean-post

.clean-pre:

.clean-post: .clean-impl


# clobber
clobber: .clobber-post

.clobber-pre:

.clobber-post: .clobber-impl


# all
all: .all-post

.all-pre:

.all-post: .all-impl


# build tests
build-tests: .build-tests-post

.build-tests-pre:

.build-tests-post: .build-tests-impl


# run tests
test: .test-post

.test-pre: build-tests

.test-post: .test-impl


# help
help: .help-post

.help-pre:

.help-post: .help-impl



# include project implementation makefile
include nbproject/Makefile-impl.mk

# include project make variables
include nbproject/Makefile-variables.mk
