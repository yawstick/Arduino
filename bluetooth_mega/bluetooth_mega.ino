


void setup() {
Serial.begin(115200);
Serial1.begin(115200);
pinMode(2, OUTPUT); //set for each pin
pinMode(3, OUTPUT);
pinMode(4, OUTPUT);
pinMode(5, OUTPUT);
pinMode(6, OUTPUT);
//pinMode(7, OUTPUT);
pinMode(8, OUTPUT);
pinMode(9, OUTPUT);
pinMode(10, OUTPUT);
pinMode(11, OUTPUT);
pinMode(12, OUTPUT);
}
void loop() {

if (Serial1.available() >= 2) {
digitalWrite(10,1);  
int key = Serial1.read();
int val = Serial1.read();
if (key >= 20) {
 int n = (key -20);
 int b = (val  * 17);
  analogWrite(n, b);
}

else { digitalWrite(key, val);}

if (key == 30 & val == 0){
 for (int i=2; i <= 13; i++){
   int t = (i+20);
   
   Serial1.write(i);
   Serial1.write(highByte(0));
   Serial1.write(lowByte(0));
   
    digitalWrite(i, 0);
  }}
  
  if (key == 30 and val == 1){
  for (int i=2; i <= 13; i++){
    digitalWrite(i, 1);
  }}
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
Serial.flush();
delay(300);
digitalWrite(10,0);
}
}
