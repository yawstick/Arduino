// Adafruit Motor shield library
// copyright Adafruit Industries LLC, 2009
// this code is public domain, enjoy!

#include <AFMotor.h>

// Connect a stepper motor with 48 steps per revolution (7.5 degree)
// to motor port #2 (M3 and M4)
AF_Stepper motor(200, 2);

void setup() {
  Serial.begin(115200);           // set up Serial library at 9600 bps
  Serial.println("Stepper test!");

  motor.setSpeed(200);  // 10 rpm   
}

void loop() {
 
  Serial.println("Interleave coil steps");
 // motor.setSpeed(20);
//  motor.step(20, FORWARD, INTERLEAVE); 
 motor.setSpeed(50);
   motor.step(500, FORWARD, INTERLEAVE); 
   motor.setSpeed(100);
  motor.step(1000, FORWARD, DOUBLE); 
  motor.setSpeed(120);
motor.step(1000, FORWARD, DOUBLE); 
 motor.setSpeed(140);
motor.step(1000, FORWARD, DOUBLE); 
motor.setSpeed(150);
motor.step(1000, FORWARD, DOUBLE); 
motor.setSpeed(160);
motor.step(1000, FORWARD, DOUBLE); 
motor.setSpeed(170);
motor.step(1000, FORWARD, DOUBLE); 

//halt();
start();
//halt();

 delay(1000);
}


void  start()   {
  
    for (int i=60; i <= 280; i= i + 10){
      motor.setSpeed(i);
      motor.step(2000, FORWARD, DOUBLE
      ); 
      Serial.println(i);
    }
}
   
   
void  halt()   {
  
    for (int i=250; i <= 10; i-10){
      motor.setSpeed(i);
      motor.step(50, FORWARD, DOUBLE); 
      Serial.println(i);
    }
}
      

