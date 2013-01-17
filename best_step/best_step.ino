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

// you can change these to DOUBLE or INTERLEAVE or MICROSTEP!
// wrappers for the first motor!
void forwardstep1() {  
  motor1.onestep(FORWARD, SINGLE);
}
void backwardstep1() {  
  motor1.onestep(BACKWARD, SINGLE);
}
// wrappers for the second motor!
void forwardstep2() {  
  motor2.onestep(FORWARD, SINGLE);
}
void backwardstep2() {  
  motor2.onestep(BACKWARD, SINGLE);
}


  int sp1 = 800;
   int ac1 = 500;
   int mv1 = 100;
    int sp2 = 800;
   int ac2 = 500;
   int mv2 = 100;
   
   int key = 0;

// Motor shield has two motor ports, now we'll wrap them in an AccelStepper object
AccelStepper stepper1(forwardstep1, backwardstep1);
AccelStepper stepper2(forwardstep2, backwardstep2);

void setup()
{  
 Serial.begin(115200);   
Serial1.begin(115200);   // set up Serial library at 9600 bps
  Serial.println("Motor test!");
}

void loop()
{
  
   stepper1.setMaxSpeed(sp1);
    stepper1.setAcceleration(ac1);
    stepper1.moveTo(mv1);
    stepper2.setMaxSpeed(sp2);
    stepper2.setAcceleration(ac2);
    stepper2.moveTo(mv2);
           if (Serial1.available() >= 1)  readser();
     
    
    
   // if (stepper1.distanceToGo() == 0) readser();
   // stepper2.setMaxSpeed(300.0);
   // stepper2.setAcceleration(100.0);
   // stepper2.moveTo(-5000);
    
  
  
    // Change direction at the limits
    //if (stepper1.distanceToGo() == 0)
	//stepper1.moveTo(-stepper1.currentPosition());
    stepper1.run();
    stepper2.run();
}

void readser()   {
int key = Serial1.read();


//digitalWrite(10,1);  

Serial.println(key);

  
  switch (key)  {
    
    
    case 85:
        mv1 = (stepper1.targetPosition() + 200);
        mv2 = (stepper2.targetPosition() + 200);
        //Serial.println(key);
        break;
        
    case 68:
        mv1 = (stepper1.targetPosition() - 200);
         mv2 = (stepper2.targetPosition() - 200);
        //Serial.println(key);
         break;

    case 67:
        stepper1.disableOutputs();
        stepper2.disableOutputs();
       // stepper1.setCurrentPosition(0);
       // stepper1.enableOutputs();
        break;


  }
  }

  

