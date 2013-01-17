#define BITS_PER_MESSAGE 12

#define B_1 900              //1.2 milliseconds        
#define B_0 1400                //0.6 milliseconds       
#define START_BIT 2000   //making it a little shorter than the actual 2400   
#define IR_PIN A0

 
//find the threshold time b/w the two pulse sizes
#define BIT_THRESH B_0+((B_1-B_0)/2)

int b;
 
void setup() {
  pinMode(IR_PIN, INPUT);
  delay(1000);
  Serial.begin(9600);
  Serial.println("Ready...");
}
 
void loop() {
  //int where we are storing code, must start at 0
  unsigned int code = 0x00;
  int i;
   
 
  Serial.println("Waiting for first pulse");
 
  //block until start pulse
  while (pulseIn(IR_PIN, LOW) < START_BIT) {}
 
  //read in next 12 bits shifting and masking them into the unsigned int 'code'
  //remeber boolean is basically 0 [false] or 1 [true]
  for (byte i = 0; i < BITS_PER_MESSAGE; i++) {
      code |= (pulseIn(IR_PIN, LOW) > BIT_THRESH) << i;  
  }
  switch (code) {
        
    case 144:
    b = (b + 20);  
    Serial.println(b);
    break;
    
    case 145:
    b = (b - 10);
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
  delay(500);
}
