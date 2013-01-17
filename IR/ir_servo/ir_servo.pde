// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
#define BITS_PER_MESSAGE 12

#define B_1 900              //1.2 milliseconds        
#define B_0 1400                //0.6 milliseconds       
#define START_BIT 2000   //making it a little shorter than the actual 2400   
#define IR_PIN A0
#define BIT_THRESH B_0+((B_1-B_0)/2)
 
 
Servo myservo;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
 
int pos = 20;    // variable to store the servo position 
int spd1 = 90;
uint8_t spd2;
uint8_t spd;
 
void setup() 
{ 
  myservo.attach(10);  // attaches the servo on pin 9 to the servo object 
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Motor test!");
  pinMode(IR_PIN, INPUT);
  myservo.write(spd1);
} 
 
 
void loop() 
{
 
    int code = 0x00;
   Serial.println("Waiting for first pulse");
   
  while (pulseIn(IR_PIN, LOW) < START_BIT) {}   //block until start pulse
 
  //read in next 12 bits shifting and masking them into the unsigned int 'code'
  //remeber boolean is basically 0 [false] or 1 [true]
  for (byte i = 0; i < BITS_PER_MESSAGE; i++) {
      code |= (pulseIn(IR_PIN, LOW) > BIT_THRESH) << i;  
         
  }
  
  
  switch (code) {
    
    
    case 144:
    spd1 = (spd1 + 1);
    if (spd1 > 140){
      spd1 = 140;
    }
    break;
    
    case 145:
    spd1 = (spd1 - 1);
    if (spd1 < 30)
    {
      spd1 = 30;
    }
    break;
    
     case 146:
    spd1 = (spd1 + 5);
    if (spd1 > 150){
      spd1 = 150;
    }
    
    break;
    
     case 147:
    spd1 = (spd1 -5);
    if (spd1 < 30){
      spd1 = 30;
    }
    
    break;
      
  
  }
  
                    // in steps of 1 degree 
    myservo.write(spd1);              // tell servo to go to position in variable 'pos' 
    delay(5);     // waits 15ms for the servo to reach the position 
  
 Serial.println(code);
 Serial.println(pos);
 Serial.println(spd1);
   
} 
