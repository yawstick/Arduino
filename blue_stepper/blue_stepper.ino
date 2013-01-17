// MultiStepper
// -*- mode: C++ -*-
//
// Control both Stepper motors at the same time with different speeds
// and accelerations. 
// Requires the AFMotor library (https://github.com/adafruit/Adafruit-Motor-Shield-library)
// And AccelStepper with AFMotor support (https://github.com/adafruit/AccelStepper)
// Public domain!

#include <AccelStepper.h>
#include <AFMotor.h>

// two stepper motors one on each port
AF_Stepper motor1(200, 1);
AF_Stepper motor2(200, 2);
float sp1 =  600;
float ac1 = 500;
int  mv1 = 0;
int tp1 = 0;

float sp2 =  600;
float ac2 =  500;
int  mv2 = 0;
int tp2 = 0;

// you can change these to DOUBLE or INTERLEAVE or MICROSTEP!
// wrappers for the first motor!
void forwardstep1() {  
  motor1.onestep(FORWARD, DOUBLE);
}
void backwardstep1() {  
  motor1.onestep(BACKWARD, DOUBLE);
}
// wrappers for the second motor!
void forwardstep2() {  
  motor2.onestep(FORWARD, DOUBLE);
}
void backwardstep2() {  
  motor2.onestep(BACKWARD, DOUBLE);
}

// Motor shield has two motor ports, now we'll wrap them in an AccelStepper object
AccelStepper stepper1(forwardstep1, backwardstep1);
AccelStepper stepper2(forwardstep2, backwardstep2);

void setup()
{  
Serial.begin(115200);
Serial1.begin(115200);

stepper1.setMaxSpeed(sp1);
stepper1.setAcceleration(ac1);
stepper1.move(mv1);
 
stepper2.setMaxSpeed(sp2);
stepper2.setAcceleration(ac2);
stepper2.move(mv2);
 
}

void loop()
{
   if (Serial1.available() >= 1) {
    stepper1.enableOutputs();
    stepper1.enableOutputs();
        readser();}
    //if (stepper1
    // Change direction at the limits
    //if (stepper1.distanceToGo() == 0)
	//stepper1.moveTo(-stepper1.currentPosition());
    stepper1.run();
    stepper2.run();

}

void readser() {
      int key = Serial1.read();
      Serial.println(key);
      switch (key){
{
          case     85:
          //stepper1.setCurrentPosition(0);
          //stepper2.setCurrentPosition(0);	
         // tp1 = stepper1.targetPosition();
         // tp2 = stepper2.targetPosition();
          // mv1 = tp1 +200;
          // mv2 = tp2 +200;
           Serial.println(stepper1.targetPosition());
           Serial.println(stepper2.targetPosition());
           stepper1.move(500) ;
           stepper2.move(500);
           break;
           
           case     82:
           //stepper1.setCurrentPosition(0);
           //stepper2.setCurrentPosition(0);
           //tp1 = (stepper1.targetPosition());
           //tp2 = (stepper2.targetPosition()+200 );
          
           // int tp1  = (stepper1.targetPosition() + 100);
           // int tp2  = (stepper2.targetPosition() + 200);
           Serial.println(stepper1.targetPosition());
           Serial.println(stepper2.targetPosition());
           stepper1.move(100) ;
           stepper2.move(200);
           break;
           
           case     76:
           //stepper1.setCurrentPosition(0);
           //stepper2.setCurrentPosition(0);
           //tp1 = (stepper1.targetPosition()+200);
           //tp2 = (stepper2.targetPosition() );
          
           //mv1 = (stepper1.targetPosition() + 200);
           //mv2 = (stepper2.targetPosition() + 100);
           Serial.println(stepper1.targetPosition());
           Serial.println(stepper2.targetPosition());
          stepper1.move(200);
           stepper2.move(100);
           break;
           
           
            case     68:
            
            Serial.println(stepper1.targetPosition());
           Serial.println(stepper2.targetPosition());
              stepper1.move(-200) ;
           stepper2.move(-200);
           break;
            
           
           case     67:
           stepper1.setCurrentPosition(0);
           stepper2.setCurrentPosition(0);
           mv1 = 0;
           mv2 = 0;
           stepper1.disableOutputs();
           stepper2.disableOutputs();
           break;
           
}
}
}

