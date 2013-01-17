#include <AFMotor.h>

AF_Stepper step1(200, 2);   // A 200-step-per-revolution motor on channels 3 & 4


void setup(){


}

void loop(){
  
step1.setSpeed(200); 

for (int i = 0; i < 4; i++) {
step1.step(2000, FORWARD, DOUBLE); // 100 steps forward using double coil stepping
delay(1000);
step1.step(2000, FORWARD, SINGLE);
delay(2000);
step1.step(2000, FORWARD, MICROSTEP);
delay(3000);

}
step1.release();
delay(5000);
}
