#define BITS_PER_MESSAGE 12

#define B_1 900              //1.2 milliseconds        
#define B_0 1400                //0.6 milliseconds       
#define START_BIT 2000   //making it a little shorter than the actual 2400   
#define IR_PIN A0

 
//find the threshold time b/w the two pulse sizes
#define BIT_THRESH B_0+((B_1-B_0)/2)
int b = 25;
int d = 25;
int o = 0;

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
  
  
  Serial.println("Waiting for input");
  Serial.println();
  
  int lumen = analogRead(1);
 
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
       Serial.println("Channel Up");
        for(int x = 2; x < 200; x = x + 20){
        analogWrite(3, x);
        delay(b);
        }
    for(int x = 200 ; x !=0; x = x - 20){
      analogWrite(3, x);
      delay(b);
  }
  analogWrite(3, 0); 
       break;
   
   
   
    case 145:
    b = (b - 1);
    if (b < 0){
     b = 0;
   }
   Serial.println("Channel Down");
    for(int x = 2; x < 200; x = x + 20){
    analogWrite(9, x);  
    delay(b);
        }
    for(int x = 200 ; x !=0; x = x - 20){
    analogWrite(9, x);  
    delay(b);
        }
    analogWrite(9, 0);
    
    break;  
   
   
   
    case 146:
    b = (b - 1);
    if (b < 0){
     b = 0;
   }
    Serial.println("Volume Up");
    
    for(int x = 2; x < 200; x = x + 20){
    analogWrite(10, x);  
    delay(b);
        }
    for(int x = 200 ; x !=0; x = x - 20){
    analogWrite(10, x);  
    delay(b);
        }
    analogWrite(10, 0);
    
    break;    
   
     case 147:
    b = (b - 1);
    if (b < 0){
     b = 0;
   }
    Serial.println("Volume Down");
    for(int x = 2; x < 200; x = x + 20){
    analogWrite(11, x);  
    delay(b);
        }
    for(int x = 200 ; x !=0; x = x - 20){
    analogWrite(11, x);  
    delay(b);
        }
    analogWrite(11, 0);
    
    break;    
   
   
   
  }
  
  
  void flshlt() {
    
    for(int x = 2; x < 200; x = x + d){
    analogWrite(o, x);  
    delay(b);
        }
    for(int x = 200 ; x !=0; x = x - d){
    analogWrite(o, x);  
    delay(b);
        }
    analogWrite(o, 0);
    
    break;    
    
  }
    
    
    
  
  void printinfo() {
  
  Serial.print("The key code is  "); 
  Serial.println(code);
  
  Serial.print("Increment value is  "); 
  Serial.println(d);
  
  Serial.print("The output pin is "); 
  Serial.println(o);
  
  
  Serial.print("The delay time is ");
  Serial.println(b);
   Serial.print("The lumens are ");
   
  Serial.println(lumen);
    Serial.println();
  }
 
 
}
