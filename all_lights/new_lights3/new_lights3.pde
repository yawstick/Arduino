int x;
int z= 15;
int t= 15;
int w= 50;
int c;
int y;
int h;
int q;
int myPins[] = {3, 5, 6, 9, 10, 11};

void setup(){
    Serial.begin(9600);
    Serial.println("Ready...");  
    }
    
void loop()  {  
   y = analogRead(0);
   z = map(y, 1, 1024, 1, 15);
   mymap();
   for (x = 0; x < 6; x++) {
      c = myPins[x];
      flash();
   }
   myprint();
   for (x = 4; x > 0 ; x--) {
      c = myPins[x];
      flash();
   } 
   myprint();
}

void flash()   {
      for(q = 2; q < 200; q = q + 5){
         analogWrite(c, q);
         delay(z);
      } 
      for(q = 200 ; q > 0; q = q - 5){
         analogWrite(c, q);  
        delay(z);
      }
  analogWrite(c, 0);
   delay(w);
}    

void mymap(){
   h = map(y, 1, 1024, -128, 128);
 
}

void myprint(){
  Serial.print("analog read = ");
      Serial.print(y);
      Serial.print("  ");
      Serial.println(z);
      Serial.println(h);
  
  
}
 
