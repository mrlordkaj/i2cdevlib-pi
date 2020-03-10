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


# build
build: .build-post

.build-pre:
# Add your pre 'build' code here...

.build-post: .build-impl
# Add your post 'build' code here...
# Copy all header files
	[ -d ${CND_DISTDIR}/include ] || mkdir ${CND_DISTDIR}/include
	cp AD7746/AD7746.h ${CND_DISTDIR}/include/AD7746.h
	cp ADS1115/ADS1115.h ${CND_DISTDIR}/include/ADS1115.h
	cp ADXL345/ADXL345.h ${CND_DISTDIR}/include/ADXL345.h
	cp AK8963/AK8963.h ${CND_DISTDIR}/include/AK8963.h
	cp AK8975/AK8975.h ${CND_DISTDIR}/include/AK8975.h
	cp BMA150/BMA150.h ${CND_DISTDIR}/include/BMA150.h
	cp BMP085/BMP085.h ${CND_DISTDIR}/include/BMP085.h
	cp DS1307/DS1307.h ${CND_DISTDIR}/include/DS1307.h
	cp HMC5843/HMC5843.h ${CND_DISTDIR}/include/HMC5843.h
	cp HMC5883L/HMC5883L.h ${CND_DISTDIR}/include/HMC5883L.h
	cp HTU21D/HTU21D.h ${CND_DISTDIR}/include/HTU21D.h
	cp IAQ2000/IAQ2000.h ${CND_DISTDIR}/include/IAQ2000.h
	cp ITG3200/ITG3200.h ${CND_DISTDIR}/include/ITG3200.h
	cp L3G4200D/L3G4200D.h ${CND_DISTDIR}/include/L3G4200D.h
	cp L3GD20H/L3GD20H.h ${CND_DISTDIR}/include/L3GD20H.h
	cp LM73/LM73.h ${CND_DISTDIR}/include/LM73.h
	cp LSM303DLHC/LSM303DLHC.h ${CND_DISTDIR}/include/LSM303DLHC.h
	cp MPR121/MPR121.h ${CND_DISTDIR}/include/MPR121.h
	cp MPU6050/MPU6050.h ${CND_DISTDIR}/include/MPU6050.h
	cp MPU9150/MPU9150.h ${CND_DISTDIR}/include/MPU9150.h
	#cp MS5803/MS5803.h ${CND_DISTDIR}/include/MS5803.h
	cp SSD1308/SSD1308.h ${CND_DISTDIR}/include/SSD1308.h
	cp TCA6424A/TCA6424A.h ${CND_DISTDIR}/include/TCA6424A.h

# clean
clean: .clean-post

.clean-pre:
# Add your pre 'clean' code here...

.clean-post: .clean-impl
# Add your post 'clean' code here...


# clobber
clobber: .clobber-post

.clobber-pre:
# Add your pre 'clobber' code here...

.clobber-post: .clobber-impl
# Add your post 'clobber' code here...


# all
all: .all-post

.all-pre:
# Add your pre 'all' code here...

.all-post: .all-impl
# Add your post 'all' code here...


# build tests
build-tests: .build-tests-post

.build-tests-pre:
# Add your pre 'build-tests' code here...

.build-tests-post: .build-tests-impl
# Add your post 'build-tests' code here...


# run tests
test: .test-post

.test-pre: build-tests
# Add your pre 'test' code here...

.test-post: .test-impl
# Add your post 'test' code here...


# help
help: .help-post

.help-pre:
# Add your pre 'help' code here...

.help-post: .help-impl
# Add your post 'help' code here...



# include project implementation makefile
include nbproject/Makefile-impl.mk

# include project make variables
include nbproject/Makefile-variables.mk
