void setup() {
Serial.begin(115200);
pinMode(3, OUTPUT); //set for each pin
pinMode(4, OUTPUT);
pinMode(5, OUTPUT);
pinMode(6, OUTPUT);
pinMode(7, OUTPUT);
pinMode(8, OUTPUT);
pinMode(9, OUTPUT);
pinMode(10, OUTPUT);
pinMode(11, OUTPUT);
pinMode(2, OUTPUT);

}
void loop() {
if (Serial.available() >= 2) {
digitalWrite(10,1);
char key = Serial.read();
char val = Serial.read();
//char key1 = Serial.read();
//char val1 = Serial.read();
//char key2 = Serial.read();
//char val2 = Serial.read();
digitalWrite(key, val);
Serial.print("key ");
Serial.print(key);
Serial.print(" val ");
Serial.println(val);
//Serial.print(" key1 ");
//Serial.print(key1, BIN);
//Serial.print(" val1 ");
//Serial.print(val1, BIN);
//Serial.print(" key ");
//Serial.print(key2, BIN);
//Serial.print(" val2 ");
//Serial.println(val2, BIN);
Serial.flush();
delay(500);
digitalWrite(10,0);

}
}
