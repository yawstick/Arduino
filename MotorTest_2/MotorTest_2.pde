// Adafruit Motor shield library
// copyright Adafruit Industries LLC, 2009
// this code is public domain, enjoy!

#include <AFMotor.h>

AF_DCMotor motor(4);
//AF_DCMotor motor(4);

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Motor test!");

  // turn on motor
  motor.setSpeed(200);
 
  motor.run(RELEASE);
}

void loop() {
  
   int x = analogRead(3);
  int y = analogRead(5);
  
  int xa = ((x/16)-32);
  int ya = ((y/16)-32);
  
  int pos1 = (90 + xa);
  int pos2 = (90 + ya);
  
  uint8_t i;
  
  Serial.println("tick");
  Serial.println(pos1);
  Serial.println(pos2);
  delay(500);
  
  
//  motor.run(FORWARD);
//  for (i=0; i<255; i++) {
//    motor.setSpeed(i);  
//    delay(10);
// }
 
//  for (i=255; i!=0; i--) {
//    motor.setSpeed(i);  
//    delay(10);
// }
  
//  Serial.println("tock");

//  motor.run(BACKWARD);
//  for (i=0; i<255; i++) {
//    motor.setSpeed(i);  
//    delay(10);
// }
 
//  for (i=255; i!=0; i--) {
//    motor.setSpeed(i);  
//    delay(10);
// }
  

//  Serial.println("tech");
//  motor.run(RELEASE);
//  delay(1000);
}
