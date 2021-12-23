#include <unistd.h> // standard libs
#include <Arduino.h> // abstract layer
#include <i2cdevlib/MPU6050.h>

int main() {
    int16_t ax, ay, az; // accelerometer raw
    int16_t gx, gy, gz; // gyroscope raw
    MPU6050 mpu;
    mpu.initialize();
    if (mpu.testConnection()) { // test sensor connection
        while (true) {
            mpu.getMotion6(&ax, &ay, &az, &gx, &gy, &gz); // get raw data
            printf("a/g: ");
            printf("%6d %6d %6d / ", ax, ay, az);
            printf("%6d %6d %6d\r\n", gx, gy, gz);
            fflush(stdout); // force show new line
            sleep(1); // sleep 1 second
        }
    } else {
        fprintf(stderr, "MPU6050 connection failed");
        return 1;
    }
    return 0;
}