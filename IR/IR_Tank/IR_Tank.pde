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
 

AF_DCMotor motor1(1);
AF_DCMotor motor2(3);
//AF_DCMotor motor(4);
int spd1;
int spd2;
int spd;
int spdlft;
int spdrt;
int button;
float bat;
float volts;
int spdlft_h;
int spdrt_h;

  uint8_t i;
   

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Motor test!");
  pinMode(IR_PIN, INPUT);
  
  
 
  // turn on motor
//  motor1.setSpeed(200);
//  motor1.run(RELEASE);
}

void loop() {
  
   bat = analogRead(1);
   volts = bat / 204;
   
   Serial.println("Waiting for first pulse");
   int code = 0x00;
   
  while (pulseIn(IR_PIN, LOW) < START_BIT) {}   //block until start pulse
 
  //read in next 12 bits shifting and masking them into the unsigned int 'code'
  //remeber boolean is basically 0 [false] or 1 [true]
  for (byte i = 0; i < BITS_PER_MESSAGE; i++) {
      code |= (pulseIn(IR_PIN, LOW) > BIT_THRESH) << i;  
      button = code;
    
  }
  //setspd();
  
    switch (button) {
    
      case 144:
    
    spdlft = (spdlft + 10);
    spdrt = (spdrt + 10);
    setspd();
      break;
    
      case 145:
    spdlft = (spdlft - 10);
    spdrt = (spdrt - 10);
    setspd();
  
    break;
    
    case 146:
    
      spdlft_h = spdlft;
      spdrt_h = spdrt;
      spdlft = 0;
      setspd();
      delay(250);
      spdlft = spdlft_h;
      setspd();
      
      break;
      
      case 147:
      spdlft_h = spdlft;
      spdrt_h = spdrt;
     
      spdrt = 0;
      setspd();
      delay(250);
      spdrt = spdrt_h;
      setspd();
      break;
    
    
       
    case 244:
    
      motor1.run(FORWARD);
      motor2.run(FORWARD);
     
     //setspd();
      break;
  
    case 245:
    
      motor1.run(BACKWARD);
      //motor1.setSpeed(spd1ft);
      motor2.run(BACKWARD);
      //motor2.setSpeed(spdrt);
       setspd();
      break;
      
    case 229:
    spd1 = 0;
    spdlft = 0;
    spdrt = 0;
    motor1.run(RELEASE);
    motor2.run(RELEASE);
    setspd();
    break;
      
      case 180:
      spdlft = (spdlft +2);
      spdrt = (spdrt - 2);
      setspd();
      break;
      
      case 179:
      spdrt = (spdrt + 2);
      spdlft = (spdlft -2);
      setspd();
      break;
      
      default:
      
      setspd();
      break;
  }
}
  
  void setspd(){
    motor1.setSpeed(spdlft);
    motor2.setSpeed(spdrt);
    Serial.print("code ");
    Serial.println(button);
    Serial.print("speed ");
    Serial.println(spd1);
    Serial.print("speed left ");
    Serial.println(spdlft);
    Serial.print("speed right ");
    Serial.println(spdrt);
    Serial.print("battery ");
    Serial.println(bat);
    Serial.print("volts ");
    Serial.println(volts);
  
    
  delay(20);
 
}
