 void setup()
    {
      uint8_t i;
    }


void loop()  {  
  int x;
  int z= 10;
  int t= 10;
  int w= 200;
  
    for(int x = 2; x < 175; x = x + 5){
       analogWrite(3, x);
       delay(z);
  }
    for(int x = 175 ; x !=0; x = x - 5){
       analogWrite(3, x);
       delay(t);
  }
    analogWrite(3, 0);
     delay(w); 
  
  
    for(int x = 2; x < 175; x = x + 5){
      analogWrite(6, x);  
      delay(z);
  }
    for(int x = 175 ; x !=0; x = x - 5){
      analogWrite(6, x);  
      delay(t);
  }
    analogWrite(6, 0);
      delay(w);
  
  
    for(int x = 2; x < 175; x = x + 5){
      analogWrite(5, x);
      delay(z);
  }
    for(int x = 175 ; x !=0; x = x - 5){
      analogWrite(5, x);  
      delay(t);
  }
    analogWrite(5, 0);
      delay(w);
    
  
    for(int x = 2; x < 175; x = x + 5){
      analogWrite(9, x);
      delay(z);
  }
   
   for(int x = 175 ; x !=0; x = x - 5){
      analogWrite(9, x);  
      delay(t);
  }
  analogWrite(9, 0);
    delay(w);
    
 
    
}
