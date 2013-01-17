#include <Wire.h>

#define LED_1 5
#define LED_2 6
#define LED_3 8

int x;

void setup() {
  Wire.begin(9);                // Start I2C Bus as a Slave (Device Number 9)
  Wire.onReceive(receiveEvent); // register event
  
  pinMode(LED_1, OUTPUT);
  pinMode(LED_2, OUTPUT);
  pinMode(LED_3, OUTPUT);
  
  digitalWrite(LED_3, LOW);
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  
  x = 0;
}

void loop() {
  //If value received is 0 blink LED 1
  if (x == 2) {
    digitalWrite(LED_1, HIGH);
    delay(200);
    digitalWrite(LED_1, LOW);
    delay(200);
  }
  //If value received is 1 blink LED 2
  if (x == 3) {
    digitalWrite(LED_2, HIGH);
    delay(200);
    digitalWrite(LED_2, LOW);
    delay(200);
  }
   if (x == 4) {
    digitalWrite(LED_3, HIGH);
    delay(200);
    digitalWrite(LED_3, LOW);
    delay(200);
  }
  
  
}

void receiveEvent(int howMany) {
  x = Wire.read();    // receive byte as an integer
}
