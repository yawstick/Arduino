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

if (Serial.available() >= 5) {
digitalWrite(9,1);

int val1 = Serial.read();
int val2 = Serial.read();
int val3 = Serial.read();
int val4 = Serial.read();
int val5 = Serial.read();

int pwm1 = map(val1, 0, 1024, 0, 255);
analogWrite(3, pwm1); 
delay(300);
digitalWrite(9,0);
}
}



