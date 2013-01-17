// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
 
Servo myserv1;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
Servo myserv2;
Servo myserv3;
Servo myserv4;
int pos = 90;    // variable to store the servo position 
 
void setup() 
{ 
  myserv1.attach(2); 
  myserv2.attach(4);
  myserv3.attach(7);
  myserv4.attach(8);// attaches the servo on pin 9 to the servo object 
} 
 
 
void loop() 
{ 
  int x = analogRead(0);
  int y = analogRead(1);
  
  int xa = ((x/16)-32);
  int ya = ((y/16)-32);
  
  int pos1 = (90 + xa);
  int pos2 = (90 + ya);
  
  
 
  
  
    myserv1.write(pos1);              // tell servo to go to position in variable 'pos' 
    //delay(250); 
    myserv2.write(pos2);              // tell servo to go to position in variable 'pos' 
    //delay(250); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    //delay(250); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    //delay(250);     // waits 15ms for the servo to reach the position 

}
 


