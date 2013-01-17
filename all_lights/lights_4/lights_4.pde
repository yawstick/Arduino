int x;
int z= 1;
int t= 1;
int w= 50;
int rnd = 2;
 
 
 
void setup()
    {
      uint8_t i;
      randomSeed(analogRead(0));
    }

void loop()  {  
   for(int x = 2; x < 13; x = x + 1){
   rnd = x;
   //rnd = random(2, 13);
   flash();
   }
   for(int x = 11 ; x !=2; x = x - 1){
     rnd = x;
     flash();
   }
   
   
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
