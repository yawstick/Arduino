#define BITS_PER_MESSAGE 12
#define B_1 900              //1.2 milliseconds        
#define B_0 1400                //0.6 milliseconds       
#define START_BIT 2000   //making it a little shorter than the actual 2400   
#define IR_PIN A0
#define BIT_THRESH B_0+((B_1-B_0)/2)   //find the threshold time b/w the two pulse sizes

int z = 10;
int b = 70;
int d = 20;
int o = 0;
unsigned int button = 100;
int lumen = 0;
uint8_t i; 


 void setup()
    {

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
      button = code;
       }
 
 switch (code) {
        
    case 223:
    b = (b + 1);  
    if (b > 100){b = 100;}
    
       Serial.println("Delay  + 1");
       o = 10;
       confirm();
       break;
   
   case 227:
      b = (b - 1);
      if (b < 0){b = 0;}
    
       Serial.println("Delay - 1");
       o = 10;
       confirm();
       break; 
       
     case 128:
       o = 2;
       printinfo();
       flshlt();
       break;
       
     case 129:
       o = 3;
       printinfo();
       flshlt();
       break;
       
     case 130:
       o = 4;
       printinfo();
       flshlt();
       break;
       
     case 131:
       o = 5;
       printinfo();
       flshlt();
       break; 
 
      case 132:
       o = 6;
       printinfo();
       flshlt();
       break; 
       
      case 133:
       o = 7;
       printinfo();
       flshlt();
       break;
       
       
  }
  printinfo();
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
    
        }
        
         void confirm() {
    
    for(int x = 2; x < 200; x = x + 20){
    analogWrite(o, x);  
    delay(z);
        }
    for(int x = 200 ; x !=0; x = x - 5){
    analogWrite(o, x);  
    delay(z);
        }
    for(int x = 2; x < 200; x = x + 20){
    analogWrite(o, x);  
    delay(z);
        }
    for(int x = 200 ; x !=0; x = x - 5){
    analogWrite(o, x);  
    delay(z);
        }
    for(int x = 2; x < 200; x = x + 20){
    analogWrite(o, x);  
    delay(z);
        }
    for(int x = 200 ; x !=0; x = x - 5){
    analogWrite(o, x);  
    delay(z);
        }
    analogWrite(o, 0);
    
        }
    
void printinfo() {
  
    Serial.print("The key code is  "); 
    Serial.println(button);
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
 
    
 

