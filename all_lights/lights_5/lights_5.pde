int x;
int z= 1;
int t= 1;
int w= 50;
int rnd = 2;
int r;
val boolean;
 
 
 
void setup()
    {
      uint8_t i;
      randomSeed(analogRead(0));
       Serial.begin(9600);
       Serial.println("Ready...");
       pinMode(40, INPUT);
       pinMode(41, INPUT);
       pinMode(42, INPUT);
       pinMode(43, INPUT);
       pinMode(44, INPUT);
       pinMode(45, INPUT);
       pinMode(46, INPUT);
  pinMode(47, INPUT);
  pinMode(48, INPUT);
  pinMode(49, INPUT);
  pinMode(50, INPUT);
  pinMode(51, INPUT);
  pinMode(52, INPUT);
  pinMode(53, INPUT);
  
   digitalWrite(40, LOW);
       digitalWrite(41, LOW);
       digitalWrite(42, LOW);
       digitalWrite(43, LOW);
       digitalWrite(44, LOW);
       digitalWrite(45, LOW);
       digitalWrite(46, LOW);
       
         digitalWrite(47, HIGH);
  digitalWrite(48, HIGH);
  digitalWrite(49, HIGH);
  digitalWrite(50, HIGH);
  digitalWrite(51, HIGH);
  digitalWrite(52, HIGH);
  digitalWrite(53, HIGH);
  
  
  
  
    }

void loop()  {  
   //for(int x = 2; x < 13; x = x + 1){
   //rnd = x;
   rnd = random(2, 13);
   flash();
   
   for(int r = 40 ; x = 53; x = x + 1){
     
     test();
     //rnd = x;
     //flash();
   //}
   
   
}

void flash() {
   
    for(int x = 2; x < 175; x = x + 15){
       analogWrite(rnd, x);
       delay(z);
  }
    for(int x = 175 ; x =0; x = x - 15){
       analogWrite(rnd, x);
       delay(t);
  }
    analogWrite(rnd, 0);
     delay(w); 
}

void test() {
  digitalRead(r);
  
  
