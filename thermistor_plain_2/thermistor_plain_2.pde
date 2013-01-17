#include <math.h>

#define ThermistorPIN 0                 // Analog Pin 0
float Temp;

float temp;

int IRledPin = 13;



float vcc = 4.91;                       // only used for display purposes, if used
                                        // set to the measured Vcc.
float pad = 9850;                       // balance/pad resistor value, set this to
                                        // the measured resistance of your pad resistor
float thermr = 10000; // thermistor nominal resistance


 
float Thermistor(int RawADC) {
  long Resistance;  
  float Temp;  // Dual-Purpose variable to save space.

  Resistance=((1024 * pad / RawADC) - pad); 
  Temp = log(Resistance); // Saving the Log(resistance) so not to calculate  it 4 times later
  Temp = 1 / (0.001129148 + (0.000234125 * Temp) + (0.0000000876741 * Temp * Temp * Temp));
  Temp = Temp - 273.15;  // Convert Kelvin to Celsius                      
  
   return Temp;                                      // Return the Temperature
}


void setup() {
  Serial.begin(9600);
  pinMode(IRledPin, OUTPUT); 
 
    
}

void pulseIR(long microsecs) {
  // we'll count down from the number of microseconds we are told to wait
 
  cli();  // this turns off any background interrupts
 
  while (microsecs > 0) {
    // 38 kHz is about 13 microseconds high and 13 microseconds low
   digitalWrite(IRledPin, HIGH);  // this takes about 3 microseconds to happen
   delayMicroseconds(10);         // hang out for 10 microseconds
   digitalWrite(IRledPin, LOW);   // this also takes about 3 microseconds
   delayMicroseconds(10);         // hang out for 10 microseconds
 
   // so 26 microseconds altogether
   microsecs -= 26;
  }
 
  sei();  // this turns them back on
}




void loop() {
 gettemp();
    
 if (temp < 80){
   Serial.println("Its Nice"); 
 } 
 if (temp > 80) {
   
   SendNikonCode();
    
 }
   
   
   
 delay(5000);
  
}

void gettemp() {
  //float temp;
  temp=Thermistor(analogRead(ThermistorPIN));       // read ADC and  convert it to Celsius
  Serial.print("Celsius: "); 
  Serial.print(temp,1);                             // display Celsius
  temp = (temp * 9.0)/ 5.0 + 32.0;                  // converts to  Fahrenheit
  Serial.print(", Fahrenheit: "); 
  Serial.print(temp,1);                             // display  Fahrenheit
  Serial.println("");                                   
  //delay(5000);                                      // Delay a bit... 
}

void SendNikonCode() {
  // This is the code for my particular Nikon, for others use the tutorial
  // to 'grab' the proper code from the remote
  
  Serial.println("Sending IR Signal");
  pulseIR(9000);
  delayMicroseconds(4300);
  
  
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(4000);
  
  
  delay(5000);
  
  
  pulseIR(9000);
  delayMicroseconds(4300);
  
  
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(400);
  
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  pulseIR(700);
  delayMicroseconds(1500);
  
  pulseIR(700);
  delayMicroseconds(4000);
  
  //return;
}




