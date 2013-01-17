// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
 
Servo myserv1;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
Servo myserv2;
Servo myserv3;
Servo myserv4;
int pos = 0;    // variable to store the servo position 
 
void setup() 
{ 
  myserv1.attach(6); 
  myserv2.attach(4);
  myserv3.attach(5);
  myserv4.attach(9);// attaches the servo on pin 9 to the servo object 
} 
 
 
void loop() 
{ 
  pos = 60;   // goes from 0 degrees to 180 degrees 
                                    // in steps of 1 degree 
    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(1200); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(1200); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(1200); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(2500);     // waits 15ms for the servo to reach the position 

 
 
pos = 120;   // goes from 0 degrees to 180 degrees 
                                    // in steps of 1 degree 
    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(1200); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(1200); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(1200); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(2500);     // waits 15ms for the servo to reach the position 
                             

} 

void two() {
  loop();
  delay(5000);
}

