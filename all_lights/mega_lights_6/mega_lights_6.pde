int x;
int z= 15;
int t= 15;
int w= 50;
int rnd ;
int r;
//val boolean;
 
 
 
void setup()
    {
      uint8_t i;
      randomSeed(analogRead(0));
       Serial.begin(115200);
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
  
   digitalWrite(40, HIGH);
       digitalWrite(41, HIGH);
       digitalWrite(42, HIGH);
       digitalWrite(43, HIGH);
       digitalWrite(44, HIGH);
       digitalWrite(45, HIGH);
       digitalWrite(46, HIGH);
       
         digitalWrite(47, HIGH);
  digitalWrite(48, HIGH);
  digitalWrite(49, HIGH);
  digitalWrite(50, HIGH);
  digitalWrite(51, HIGH);
  digitalWrite(52, HIGH);
  digitalWrite(53, HIGH);
  
  
  
  
    }

void loop()  {  
   if (digitalRead(40) == 0) z = z + 5;
   if (digitalRead(41) == 0) z = z - 5; 
   if (digitalRead(42) == 0) t = t + 5; 
   if (digitalRead(43) == 0) t = t - 5; 
  
   for(int x = 2; x < 13; x = x + 1){
   rnd = x;
   flash();
   }
   for(int x = 11 ; x > 2; x = x - 1){
     rnd = x;
     flash();
   }
}

void flash() {
  
  
   
   
    for(int i = 2; i < 175; i = i + 5){
       analogWrite(rnd, i);
       delay(z);
  }
    for(int i = 175 ; i >5; i = i - 5){
       analogWrite(rnd, i);
       delay(t);
  }
    analogWrite(rnd, 0);
     delay(w); 
}

void test() {
  digitalRead(r);
  
}


