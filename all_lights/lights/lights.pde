 void setup()
    {
      uint8_t i;
    }


void loop()  {  
  uint8_t x;
  uint8_t z= 10;
  
  for(int x = 2; x < 200; x = x + 20){

  //for (i=0; i<150; i++) {
      analogWrite(3, x);
   // analogWrite(5, x);
  //analogWrite(6, x);  
      delay(z);
  }
    for(int x = 200 ; x !=0; x = x - 20){

  //for (i=0; i<150; i++) {
      analogWrite(3, x);
  //  analogWrite(5, x);
  //analogWrite(6, x);  
      delay(z);
  }
  analogWrite(3, 0); 
  
  
   for(int x = 2; x < 200; x = x + 20){

  //for (i=0; i<150; i++) {
     // analogWrite(3, x);
   // analogWrite(5, x);
  analogWrite(6, x);  
      delay(z);
  }
    for(int x = 200 ; x !=0; x = x - 20){

  //for (i=0; i<150; i++) {
   //   analogWrite(3, x);
  //  analogWrite(5, x);
  analogWrite(6, x);  
      delay(z);
  }
  analogWrite(6, 0);
  
  
   for(int x = 2; x < 200; x = x + 20){

  //for (i=0; i<150; i++) {
      analogWrite(5, x);
   // analogWrite(5, x);
  //analogWrite(6, x);  
      delay(z);
  }
   for(int x = 200 ; x !=0; x = x - 20){

  //for (i=0; i<150; i++) {
   //   analogWrite(3, x);
  //  analogWrite(5, x);
  analogWrite(5, x);  
      delay(z);
  }
  analogWrite(5, 0);
  
    for(int x = 2; x < 200; x = x + 20){

  //for (i=0; i<150; i++) {
      analogWrite(9, x);
   // analogWrite(5, x);
  //analogWrite(6, x);  
      delay(z);
  }
   
   for(int x = 200 ; x !=0; x = x - 20){

  //for (i=0; i<150; i++) {
   //   analogWrite(3, x);
  //  analogWrite(5, x);
  analogWrite(9, x);  
      delay(z);
  }
  analogWrite(9, 0);
    // for (i=150; i!=0; i--) {
    //     analogWrite(3, i);  
    //     delay(5);
    // }
// analogWrite(3, 0); 
//analogWrite(5, 0);
//analogWrite(6, 0);
 //delay(300);    
}
