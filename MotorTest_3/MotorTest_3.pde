// Adafruit Motor shield library
// copyright Adafruit Industries LLC, 2009
// this code is public domain, enjoy!

#include <AFMotor.h>


AF_DCMotor motor1(4);
AF_DCMotor motor2(3);
//AF_DCMotor motor(4);

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Motor test!");

  // turn on motor
  motor1.setSpeed(200);
  motor1.run(RELEASE);
}

void loop() {
  
   int y = analogRead(3);
  int x = analogRead(5);
  
  int xa = ((x/2)-255);    // gives you range of -127 to +127 and 0 at center stick
  int ya = ((y/2)-255);  
   if (ya > 255) { ya = 255; }
  
  int pos1 = (128 + xa);    //  gives you range of 0 to 256 with 128 at center stick
  int pos2 = (128 + ya);
 // char dir = "RELEASE";
  
  if (ya >= 10) {
        motor1.run(FORWARD);
        motor1.setSpeed(ya);
        motor2.run(FORWARD);
        motor2.setSpeed(ya);
         //delay(10);
              }
    
  if (ya <= -10)  {
    motor1.run(BACKWARD);
     motor2.run(BACKWARD);
    int yb = (ya * -1);
    motor1.setSpeed(yb);
  motor2.setSpeed(yb);   
   //delay(10);
                 }
   if (ya > -10 && ya < 10) {
     motor1.run(RELEASE);
     motor2.run(RELEASE);
     
   }
     
    
//  motor.run(dir);

 //   motor.setSpeed(ya);  
  // delay(10);
 
  
  uint8_t i;
  
  //Serial.println("tick");
  //Serial.println(pos1);
  //Serial.println(pos2);
  //Serial.println(xa);
  //Serial.println(ya);
  
  //delay(100);
}
