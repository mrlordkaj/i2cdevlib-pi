#!/bin/bash -x

#
# Generated - do not edit!
#

# Macros
TOP=`pwd`
CND_PLATFORM=GNU-Linux
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build
CND_DLIB_EXT=so
NBTMPDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}/tmp-packaging
TMPDIRNAME=tmp-packaging
OUTPUT_PATH=${CND_DISTDIR}/libi2cdev.${CND_DLIB_EXT}
OUTPUT_BASENAME=libi2cdev.${CND_DLIB_EXT}
PACKAGE_TOP_DIR=/usr/

# Functions
function checkReturnCode
{
    rc=$?
    if [ $rc != 0 ]
    then
        exit $rc
    fi
}
function makeDirectory
# $1 directory path
# $2 permission (optional)
{
    mkdir -p "$1"
    checkReturnCode
    if [ "$2" != "" ]
    then
      chmod $2 "$1"
      checkReturnCode
    fi
}
function copyFileToTmpDir
# $1 from-file path
# $2 to-file path
# $3 permission
{
    cp "$1" "$2"
    checkReturnCode
    if [ "$3" != "" ]
    then
        chmod $3 "$2"
        checkReturnCode
    fi
}

# Setup
cd "${TOP}"
mkdir -p ${CND_DISTDIR}/package
rm -rf ${NBTMPDIR}
mkdir -p ${NBTMPDIR}

# Copy files and create directories and links
cd "${TOP}"
makeDirectory "${NBTMPDIR}/DEBIAN"
copyFileToTmpDir "DEBIAN/postinst" "${NBTMPDIR}/DEBIAN/postinst" 0755

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include/avr"
copyFileToTmpDir "Arduino/avr/dtostrf.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/avr/dtostrf.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include/avr"
copyFileToTmpDir "Arduino/avr/io.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/avr/io.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include/avr"
copyFileToTmpDir "Arduino/avr/pgmspace.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/avr/pgmspace.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "Arduino/Arduino.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/Arduino.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "Arduino/Wire.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/Wire.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "I2Cdev/I2Cdev.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/I2Cdev.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "AD7746/AD7746.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/AD7746.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "ADS1115/ADS1115.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/ADS1115.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "ADXL345/ADXL345.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/ADXL345.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "AK8963/AK8963.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/AK8963.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "AK8975/AK8975.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/AK8975.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "BMA150/BMA150.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/BMA150.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "BMP085/BMP085.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/BMP085.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "DS1307/DS1307.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/DS1307.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "HMC5843/HMC5843.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/HMC5843.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "HMC5883L/HMC5883L.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/HMC5883L.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "HTU21D/HTU21D.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/HTU21D.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "IAQ2000/IAQ2000.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/IAQ2000.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "ITG3200/ITG3200.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/ITG3200.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "L3G4200D/L3G4200D.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/L3G4200D.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "L3GD20H/L3GD20H.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/L3GD20H.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "LM73/LM73.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/LM73.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "LSM303DLHC/LSM303DLHC.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/LSM303DLHC.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "MPR121/MPR121.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/MPR121.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "MPU6050/MPU6050.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/MPU6050.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "MPU9150/MPU9150.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/MPU9150.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "MS5803/MS5803.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/MS5803.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "SSD1308/SSD1308.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/SSD1308.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/include"
copyFileToTmpDir "TCA6424A/TCA6424A.h" "${NBTMPDIR}/${PACKAGE_TOP_DIR}include/TCA6424A.h" 0644

cd "${TOP}"
makeDirectory "${NBTMPDIR}//usr/lib"
copyFileToTmpDir "${OUTPUT_PATH}" "${NBTMPDIR}/${PACKAGE_TOP_DIR}lib/${OUTPUT_BASENAME}" 0644


# Create control file
cd "${TOP}"
CONTROL_FILE=${NBTMPDIR}/DEBIAN/control
rm -f ${CONTROL_FILE}
mkdir -p ${NBTMPDIR}/DEBIAN

cd "${TOP}"
echo 'Package: i2cdevlib' >> ${CONTROL_FILE}
echo 'Version: 1.0.1' >> ${CONTROL_FILE}
echo 'Architecture: armhf' >> ${CONTROL_FILE}
echo 'Maintainer: Thinh Pham' >> ${CONTROL_FILE}
echo 'Description: Unofficial i2cdevlib running on Raspberry Pi devices.' >> ${CONTROL_FILE}
echo 'Depends: wiringPi' >> ${CONTROL_FILE}

# Create Debian Package
cd "${TOP}"
cd "${NBTMPDIR}/.."
dpkg-deb  --build ${TMPDIRNAME}
checkReturnCode
cd "${TOP}"
mkdir -p  ${CND_DISTDIR}/package
mv ${NBTMPDIR}.deb ${CND_DISTDIR}/package/i2cdevlib.deb
checkReturnCode
echo Debian: ${CND_DISTDIR}/package/i2cdevlib.deb

# Cleanup
cd "${TOP}"
rm -rf ${NBTMPDIR}
