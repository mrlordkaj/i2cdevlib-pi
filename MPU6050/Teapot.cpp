/*
 * The MIT License
 *
 * Copyright 2020 Thinh Pham.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifdef MPU6050_TEAPOT

#include "Teapot.h"
#include <math.h>

int boxFaces[] = {
    0,1,2,3, // front
    4,5,6,7, // back
    0,1,5,4, // right
    3,2,6,7, // left
    1,2,6,5, // top
    0,3,7,4  // bottom
};

void drawBox(float width, float height, float length) {
    float hx = width / 2;
    float hy = height / 2;
    float hz = length / 2;
    GLfloat boxVerts[][3] = {
        { hx, -hy, -hz},
        { hx,  hy, -hz},
        {-hx,  hy, -hz},
        {-hx, -hy, -hz},
        { hx, -hy,  hz},
        { hx,  hy,  hz},
        {-hx,  hy,  hz},
        {-hx, -hy,  hz}
    };
    glBegin(GL_QUADS);
    for (int i = 0; i < 24; i++) {
        int id = boxFaces[i];
        glVertex3fv(boxVerts[id]);
    }
    glEnd();
}

void drawCylinder(float topRadius, float bottomRadius, float tall, float sides) {
    float angle = 0;
    float angleIncrement = TWO_PI / sides;
    glBegin(GL_QUAD_STRIP);
    for (int i = 0; i < sides + 1; i++) {
        glVertex3f(topRadius*cos(angle), 0, topRadius*sin(angle));
        glVertex3f(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
        angle += angleIncrement;
    }
    glEnd();
    // If it is not a cone, draw the circular top cap
    if (topRadius) {
        angle = 0;
        glBegin(GL_TRIANGLE_FAN);
        // Center point
        glVertex3f(0, 0, 0);
        for (int i = 0; i < sides + 1; i++) {
            glVertex3f(topRadius * cos(angle), 0, topRadius * sin(angle));
            angle += angleIncrement;
        }
        glEnd();
    }
    // If it is not a cone, draw the circular bottom cap
    if (bottomRadius) {
        angle = 0;
        glBegin(GL_TRIANGLE_FAN);
        // Center point
        glVertex3f(0, tall, 0);
        for (int i = 0; i < sides + 1; i++) {
            glVertex3f(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
            angle += angleIncrement;
        }
        glEnd();
    }
}

// I2Cdev and MPU6050 must be installed as libraries, or else the .cpp/.h files
// for both classes must be in the include path of your project
#include "I2Cdev.h"

#include "MPU6050_6Axis_MotionApps20.h"
//#include "MPU6050.h" // not necessary if using MotionApps include file

// class default I2C address is 0x68
// specific I2C addresses may be passed as a parameter here
// AD0 low = 0x68 (default for SparkFun breakout and InvenSense evaluation board)
// AD0 high = 0x69
MPU6050 mpu;

// MPU control/status vars
bool dmpReady = false;  // set true if DMP init was successful
uint8_t mpuIntStatus;   // holds actual interrupt status byte from MPU
uint8_t devStatus;      // return status after each device operation (0 = success, !0 = error)
uint16_t packetSize;    // expected DMP packet size (default is 42 bytes)
uint16_t fifoCount;     // count of all bytes currently in FIFO
uint8_t fifoBuffer[64]; // FIFO storage buffer
float mpuAxis[4];

void setup() {
    // opengl contex
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);
    glCullFace(GL_BACK);
    
    // projection matrix
    gluPerspective(45, (WINDOW_WIDTH/WINDOW_HEIGHT), 0.1, 2000);
    glRotatef(180, 0, 0, 1);
    glTranslatef(0.0,0.0, -400);
    
    // initialize device
    Serial.println(F("Initializing I2C devices..."));
    mpu.initialize();
    
    // verify connection
    Serial.println(F("Testing device connections..."));
    Serial.println(mpu.testConnection() ? F("MPU6050 connection successful") : F("MPU6050 connection failed"));
    
    // load and configure the DMP
    Serial.println(F("Initializing DMP..."));
    devStatus = mpu.dmpInitialize();
    
    // supply your own gyro offsets here, scaled for min sensitivity
    mpu.setXGyroOffset(220);
    mpu.setYGyroOffset(76);
    mpu.setZGyroOffset(-85);
    mpu.setZAccelOffset(1788); // 1688 factory default for my test chip
    
    // make sure it worked (returns 0 if so)
    if (devStatus == 0) {
        // Calibration Time: generate offsets and calibrate our MPU6050
        mpu.CalibrateAccel(6);
        mpu.CalibrateGyro(6);
        mpu.PrintActiveOffsets();
        // turn on the DMP, now that it's ready
        Serial.println(F("Enabling DMP..."));
        mpu.setDMPEnabled(true);

        // enable Arduino interrupt detection
//        Serial.print(F("Enabling interrupt detection (Arduino external interrupt "));
//        Serial.print(digitalPinToInterrupt(INTERRUPT_PIN));
//        Serial.println(F(")..."));
//        attachInterrupt(digitalPinToInterrupt(INTERRUPT_PIN), dmpDataReady, RISING);
        mpuIntStatus = mpu.getIntStatus();

        // set our DMP Ready flag so the main loop() function knows it's okay to use it
        Serial.println(F("DMP ready! Waiting for first interrupt..."));
        dmpReady = true;

        // get expected DMP packet size for later comparison
        packetSize = mpu.dmpGetFIFOPacketSize();
    } else {
        // ERROR!
        // 1 = initial memory load failed
        // 2 = DMP configuration updates failed
        // (if it's going to break, usually the code will be 1)
        Serial.print(F("DMP Initialization failed (code "));
        Serial.print(devStatus);
        Serial.println(F(")"));
    }
}

void updateAxisAngle(float w, float x, float y, float z) {
    float sa = (float) sqrt(1.0f - w * w);
    if (sa < EPS) {
        sa = 1.0f;
    } else {
        sa = 1.0f / sa;
    }
    mpuAxis[0] = (float) acos(w) * 2.0f;
    mpuAxis[1] = x * sa;
    mpuAxis[2] = y * sa;
    mpuAxis[3] = z * sa;
}

void GLUT_display() {
    if (dmpReady && mpu.dmpGetCurrentFIFOPacket(fifoBuffer)) {
        glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
        
        // start mpu transform
        glPushMatrix();
        
        float w = ((fifoBuffer[ 0] << 8) | fifoBuffer[ 1]) / 16384.0f;
        float x = ((fifoBuffer[ 4] << 8) | fifoBuffer[ 5]) / 16384.0f;
        float y = ((fifoBuffer[ 8] << 8) | fifoBuffer[ 9]) / 16384.0f;
        float z = ((fifoBuffer[12] << 8) | fifoBuffer[13]) / 16384.0f;
        if (w >= 2) w -= 4;
        if (x >= 2) x -= 4;
        if (y >= 2) y -= 4;
        if (z >= 2) z -= 4;
        updateAxisAngle(w, x, y, z);
        glRotatef(-mpuAxis[0]*RAD_TO_DEG, mpuAxis[1], mpuAxis[3], mpuAxis[2]);
        
        // draw main body in red
        glColor3ub(255, 0, 0);
        drawBox(10, 10, 200);
        
        // draw front-facing tip in blue
        glColor3ub(0, 0, 255);
        glPushMatrix();
        glTranslatef(0, 0, -120);
        glRotatef(90, 1, 0, 0);
        drawCylinder(0, 20, 20, 8);
        glPopMatrix();
        
        // draw wings and tail fin in green
        glColor3ub(0, 255, 0);
        glBegin(GL_TRIANGLES);
        glVertex3f(-100,  2, 30); glVertex3f(0,  2, -80); glVertex3f(100,  2, 30);  // wing top layer
        glVertex3f(-100, -2, 30); glVertex3f(0, -2, -80); glVertex3f(100, -2, 30);  // wing bottom layer
        glVertex3f(-2, 0, 98); glVertex3f(-2, -30, 98); glVertex3f(-2, 0, 70);  // tail left layer
        glVertex3f( 2, 0, 98); glVertex3f( 2, -30, 98); glVertex3f( 2, 0, 70);  // tail right layer
        glEnd();
        glBegin(GL_QUADS);
        glVertex3f(-100, 2, 30); glVertex3f(-100, -2, 30); glVertex3f(  0, -2, -80); glVertex3f(  0, 2, -80);
        glVertex3f( 100, 2, 30); glVertex3f( 100, -2, 30); glVertex3f(  0, -2, -80); glVertex3f(  0, 2, -80);
        glVertex3f(-100, 2, 30); glVertex3f(-100, -2, 30); glVertex3f(100, -2,  30); glVertex3f(100, 2,  30);
        glVertex3f(-2,   0, 98); glVertex3f(2,   0, 98); glVertex3f(2, -30, 98); glVertex3f(-2, -30, 98);
        glVertex3f(-2,   0, 98); glVertex3f(2,   0, 98); glVertex3f(2,   0, 70); glVertex3f(-2,   0, 70);
        glVertex3f(-2, -30, 98); glVertex3f(2, -30, 98); glVertex3f(2,   0, 70); glVertex3f(-2,   0, 70);
        glEnd();
        
        // end mpu transform
        glPopMatrix();
        
        // draw new screen buffer
        glutSwapBuffers();
    }
    
    // schedule new frame
    glutPostRedisplay();
}

void GLUT_reshape(int w, int h) {
    glViewport(0, 0, w, h);
}

#endif /* MPU6050_TEAPOT */