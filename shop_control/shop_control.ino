#include <SoftwareSerial.h>

SoftwareSerial mySerial(8, 7); // RX, TX




void setup() {
Serial.begin(115200);
mySerial.begin(115200);

pinMode(2, OUTPUT); //set for each pin
pinMode(3, OUTPUT);
pinMode(4, OUTPUT);
pinMode(5, OUTPUT);
pinMode(6, OUTPUT);
//pinMode(7, OUTPUT);
//pinMode(8, OUTPUT);
pinMode(9, OUTPUT);
pinMode(10, OUTPUT);
pinMode(11, OUTPUT);
pinMode(12, OUTPUT);
}
void loop() {

if (mySerial.available()) {
digitalWrite(9,1);  


     
     
     
     
     
int key = mySerial.read();
int val = mySerial.read();

switch(val){
     case 224:
     val = 1;
     break;
     
     case 128:
     val = 0;
     break;
}


digitalWrite(key, val);


//int keya = Serial.read();
//int vala = Serial.read();
//int keyb = Serial.read();
//int valb = Serial.read();
//else { digitalWrite(key, val);}
//int d = (key - 50);
//int e = (val - 50);
//Serial.write(10);
Serial.print("key ");
Serial.print(key);
Serial.print(" val ");
Serial.println(val);
//Serial.print(" keya ");
//Serial.print(keya);
//Serial.print(" vala ");
//Serial.print(vala);
//Serial.print(" keyb ");
//Serial.print(keyb);
//Serial.print(valb);
//Serial.write(13);

delay(300);
digitalWrite(9,0);
}
}
