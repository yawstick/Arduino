 void setup()
    {
      uint8_t i;
    }


void loop()  {  
  uint8_t x;
  uint8_t z= 3;
  
    for(int x = 2; x < 200; x = x + 20){
       analogWrite(3, x);
       delay(z);
  }
    for(int x = 200 ; x !=0; x = x - 20){
       analogWrite(3, x);
       delay(z);
  }
    analogWrite(3, 0); 
  
  
    for(int x = 2; x < 200; x = x + 20){
      analogWrite(6, x);  
      delay(z);
  }
    for(int x = 200 ; x !=0; x = x - 20){
      analogWrite(6, x);  
      delay(z);
  }
    analogWrite(6, 0);
  
  
    for(int x = 2; x < 200; x = x + 20){
      analogWrite(5, x);
      delay(z);
  }
    for(int x = 200 ; x !=0; x = x - 20){
      analogWrite(5, x);  
      delay(z);
  }
    analogWrite(5, 0);
    
  
    for(int x = 2; x < 200; x = x + 20){
      analogWrite(9, x);
      delay(z);
  }
   
   for(int x = 200 ; x !=0; x = x - 20){
      analogWrite(9, x);  
      delay(z);
  }
  analogWrite(9, 0);
    
      for(int x = 2; x < 200; x = x + 20){
      analogWrite(5, x);
      delay(z);
  }
    for(int x = 200 ; x !=0; x = x - 20){
      analogWrite(5, x);  
      delay(z);
  }
    analogWrite(5, 0); 
    
       for(int x = 2; x < 200; x = x + 20){
      analogWrite(6, x);  
      delay(z);
  }
    for(int x = 200 ; x !=0; x = x - 20){
      analogWrite(6, x);  
      delay(z);
  }
    analogWrite(6, 0);
    
      
    
}
