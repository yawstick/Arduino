// Adafruit Motor shield library
// copyright Adafruit Industries LLC, 2009
// this code is public domain, enjoy!

#include <AFMotor.h>
#define BITS_PER_MESSAGE 12

#define B_1 900              //1.2 milliseconds        
#define B_0 1400                //0.6 milliseconds       
#define START_BIT 2000   //making it a little shorter than the actual 2400   
#define IR_PIN A0
 
//find the threshold time b/w the two pulse sizes
#define BIT_THRESH B_0+((B_1-B_0)/2)
 

AF_DCMotor motor1(4);
AF_DCMotor motor2(3);
//AF_DCMotor motor(4);
uint8_t spd1;
uint8_t spd2;
uint8_t spd;
   

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Motor test!");
  pinMode(IR_PIN, INPUT);
  
  
 
  // turn on motor
  motor1.setSpeed(200);
  motor1.run(RELEASE);
}

void loop() {
  
   
   int code = 0x00;
   Serial.println("Waiting for first pulse");
   
  while (pulseIn(IR_PIN, LOW) < START_BIT) {}   //block until start pulse
 
  //read in next 12 bits shifting and masking them into the unsigned int 'code'
  //remeber boolean is basically 0 [false] or 1 [true]
  for (byte i = 0; i < BITS_PER_MESSAGE; i++) {
      code |= (pulseIn(IR_PIN, LOW) > BIT_THRESH) << i;  
  }

  
  // int y = analogRead(3);
  //int x = analogRead(5);
  
  //int xa = ((x/2)-255);    // gives you range of -255 to +255 and 0 at center stick
  //int ya = ((y/2)-255);  
  // if (ya > 255) { ya = 255; }
    
  //if (ya >= 10) {
   //     motor1.run(FORWARD);
   //     motor1.setSpeed(ya);
   //     motor2.run(FORWARD);
   //     motor2.setSpeed(ya);
         //delay(10);
   //           }
    
  //if (ya <= -10)  {
  //  motor1.run(BACKWARD);
  //   motor2.run(BACKWARD);
  //  int yb = (ya * -1);
  //  motor1.setSpeed(yb);
  //  motor2.setSpeed(yb);   
   //delay(10);
    //             }
   //if (ya > -10 && ya < 10) {
   //  motor1.run(RELEASE);
   // motor2.run(RELEASE);
     
   //}
     
    
//  motor.run(dir);

 //   motor.setSpeed(ya);  
  // delay(10);
 
  
  uint8_t i;
  
  
   Serial.println(code);
    Serial.println(spd1);
  
  if (code == 128) {
    Serial.println("turn left");
  }
  
  
  // spd2 = 0;
  switch (code) {
    
    
    case 144:
    spd1 = (spd1 + 10);
    motor1.setSpeed(spd1);
     motor2.setSpeed(spd1);
    break;
    
    case 145:
    spd1 = (spd1 - 10);
    
      motor1.setSpeed(spd1);
       motor2.setSpeed(spd1);
  
    break;
       
    case 244:
    
      motor1.run(FORWARD);
      motor1.setSpeed(spd1);
      motor2.run(FORWARD);
      motor2.setSpeed(spd1);
      break;
  
    case 245:
    
      motor1.run(BACKWARD);
      motor1.setSpeed(spd1);
      motor2.run(BACKWARD);
      motor2.setSpeed(spd1);
      break;
      
    case 229:
    spd1 = 0;
      motor1.run(RELEASE);
      motor1.setSpeed(spd1);
      motor2.run(RELEASE);
      motor2.setSpeed(spd1);
      break;
  }
  
  
  delay(500);
 
}
