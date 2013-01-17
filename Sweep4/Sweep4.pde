// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
 
Servo myserv1;  // create servo object to control a servo 
Servo myserv2;   // a maximum of eight servo objects can be created 
Servo myserv3;
Servo myserv4;
int pos = 0;    // variable to store the servo position 
int pin1 = 8;
int pin2 = 9;
int pin3 = 10;
int pin4 = 11;
int var = 0;
int pinread = 0;

 
void setup() 
{ 
  
  pinMode(pin1, INPUT);
  pinMode(pin2, INPUT);
  pinMode(pin3, INPUT);
  pinMode(pin4, INPUT);
  myserv1.attach(6); 
  myserv2.attach(4);
  myserv3.attach(5);
  myserv4.attach(7);// attaches the servo on pin 9 to the servo object 
} 

void loop() {

}

 
void first() 
 {
    pos = 80;
  
    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500);     // waits 15ms for the servo to reach the position 

 
 
  pos = 100;   

    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500);     // waits 15ms for the servo to reach the position 
} 

void second() 
{ 
  pos = 70;
  
    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500);     // waits 15ms for the servo to reach the position 

   pos = 110;   
  
    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500);     // waits 15ms for the servo to reach the position 

} 

void third() 
{ 
  pos = 60;
  
    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500);     // waits 15ms for the servo to reach the position 

   pos = 120;   
  
    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500);     // waits 15ms for the servo to reach the position 

} 
void forth() 
{ 
  pos = 50;
  
    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500);     // waits 15ms for the servo to reach the position 

   pos = 130;   
  
    myserv1.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv2.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv3.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500); 
    myserv4.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(500);     // waits 15ms for the servo to reach the position 

} 

