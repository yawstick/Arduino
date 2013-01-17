#define BITS_PER_MESSAGE 12

#define B_1 900              //1.2 milliseconds        
#define B_0 1400                //0.6 milliseconds       
#define START_BIT 2000   //making it a little shorter than the actual 2400   
#define IR_PIN A0

 
//find the threshold time b/w the two pulse sizes
#define BIT_THRESH B_0+((B_1-B_0)/2)
int b = 25;

 void setup()
    {
      uint8_t i;
  pinMode(IR_PIN, INPUT);
  delay(1000);
  Serial.begin(9600);
  Serial.println("Ready...");
    }


void loop()  { 
 unsigned int code = 0x00;
  int i; 
  uint8_t x;
  
  
  Serial.println("Waiting for first pulse");
 
  //block until start pulse
  while (pulseIn(IR_PIN, LOW) < START_BIT) {}
  
   for (byte i = 0; i < BITS_PER_MESSAGE; i++) {
      code |= (pulseIn(IR_PIN, LOW) > BIT_THRESH) << i; 
       }
 
 switch (code) {
        
    case 144:
    b = (b + 1);  
    if (b > 100){
      b = 100;}
      
       break;
    Serial.println(b);
   
   
    case 145:
    b = (b - 1);
    if (b < 0){
     b = 0;
   }
    
    break;   
   
  }
  
   
  Serial.println(code);
  Serial.println(b);
  if (code == 128) {
    Serial.println("turn left");
  }
 
  
  for(int x = 2; x < 200; x = x + 20){

  //for (i=0; i<150; i++) {
      analogWrite(3, x);
   // analogWrite(5, x);
  //analogWrite(6, x);  
      delay(b);
  }
    for(int x = 200 ; x !=0; x = x - 20){

  //for (i=0; i<150; i++) {
      analogWrite(3, x);
  //  analogWrite(5, x);
  //analogWrite(6, x);  
      delay(b);
  }
  analogWrite(3, 0); 
  
  
   for(int x = 2; x < 200; x = x + 20){

  //for (i=0; i<150; i++) {
     // analogWrite(3, x);
   // analogWrite(5, x);
  analogWrite(6, x);  
      delay(b);
  }
    for(int x = 200 ; x !=0; x = x - 20){

  //for (i=0; i<150; i++) {
   //   analogWrite(3, x);
  //  analogWrite(5, x);
  analogWrite(6, x);  
      delay(b);
  }
  analogWrite(6, 0);
  
  
   for(int x = 2; x < 200; x = x + 20){

  //for (i=0; i<150; i++) {
      analogWrite(5, x);
   // analogWrite(5, x);
  //analogWrite(6, x);  
      delay(b);
  }
   for(int x = 200 ; x !=0; x = x - 20){

  //for (i=0; i<150; i++) {
   //   analogWrite(3, x);
  //  analogWrite(5, x);
  analogWrite(5, x);  
      delay(b);
  }
  analogWrite(5, 0);
  
    for(int x = 2; x < 200; x = x + 20){

  //for (i=0; i<150; i++) {
      analogWrite(9, x);
   // analogWrite(5, x);
  //analogWrite(6, x);  
      delay(b);
  }
   
   for(int x = 200 ; x !=0; x = x - 20){

  //for (i=0; i<150; i++) {
   //   analogWrite(3, x);
  //  analogWrite(5, x);
  analogWrite(9, x);  
      delay(b);
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
