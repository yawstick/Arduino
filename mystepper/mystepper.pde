// #include <Stepper.h>

//#include <Stepper.h>

#ifndef _AFMotor_h_
#define _AFMotor_h_

#include <AFMotor.h>
AF_Stepper Stepper1(200, 2);   // A 200-step-per-revolution motor on channels 3 & 4


Stepper1.step(100, FORWARD, DOUBLE); // 100 steps forward using double coil stepping
