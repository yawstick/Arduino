


void setup() {
Serial.begin(9600);
pinMode(2, OUTPUT); //set for each pin
pinMode(3, OUTPUT);
pinMode(4, OUTPUT);
pinMode(5, OUTPUT);
pinMode(6, OUTPUT);
pinMode(7, OUTPUT);
pinMode(8, OUTPUT);
pinMode(9, OUTPUT);
pinMode(10, OUTPUT);
pinMode(11, OUTPUT);
pinMode(12, OUTPUT);
}
void loop() {

if (Serial.available() >= 2) {
digitalWrite(10,1);  
int key = Serial.read();
int val = Serial.read();
//int keya = Serial.read();
//int vala = Serial.read();
//int keyb = Serial.read();
//int valb = Serial.read();
digitalWrite(key, val);
//int d = (key - 50);
//int e = (val - 50);
Serial.write(10);
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
Serial.flush();
delay(500);
digitalWrite(10,0);
}
}
