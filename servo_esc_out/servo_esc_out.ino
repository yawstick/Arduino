/*  
    Arduino thermistor example software
    Tutorial:  http://www.hacktronics.com/Tutorials/arduino-thermistor-tutorial
    Copyright (c) 2010 Mark McComb, hacktronics LLC
    License: http://www.opensource.org/licenses/mit-license.php (Go crazy)
*/

#include <LiquidCrystal.h>
//#include <math.h>
#include <Servo.h> 

Servo esc_out;

int esc = 900;

LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
int backLight = 10;    // pin 10 will control the backlight
int adc_key_in = 0;
int button = 0;
int screen = 0;


void setup(void) {
   esc_out.attach(11);
 // esc_out.writeMicroseconds(esc);  // set servo to mid-point
  
  
  pinMode(backLight, OUTPUT);
  analogWrite(backLight, esc); // turn backlight on. Replace 'HIGH' with 'LOW' to turn it off.
  lcd.begin(16, 2);              // rows, columns.  use 16,2 for a 16x2 LCD, etc.
  lcd.clear();                   // start with a blank screen
  lcd.setCursor(0,0);            // set cursor to column 0, row 0
}



int printTemp() {
 
 //int temp = analogRead(0);  // Read sensor
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("Screen 1: ");
  lcd.print(esc);
  //lcd.print(" F");
  lcd.setCursor(0,1);
  lcd.print("Lumens: ");
  lcd.print(esc);
  
 
 }

void loop(void) {
  read_buttons();
  printTemp();
  analogWrite(backLight, esc);
  
  delay(200);
}



void write_esc() {
  
  esc_out.writeMicroseconds(esc);  // set servo to mid-point

}

int read_buttons() //  read the buttons keyboard voltage test routine. Returns int ex: 'btnTEST' is #defined as '4'
     // button returned values centered at these values: 002, 130, 306, 478, 720 added approx 50 for buffer zone
     // use 'buttonTEST' program on seperate file to display the button values or troubleshoot
{
 adc_key_in = analogRead(0);  // read the value from the sensor for keypad and then test the value for button levels.
 delay(5); //switch debounce delay. Increase this delay if incorrect switch selections are returned.
 int k = (analogRead(0) - adc_key_in); //gives the button a slight range to allow for a little contact resistance noise
 if (5 < abs(k)) return 10;  // double checks the keypress. If the two readings are not equal +/-k value after debounce delay, it tries again. if (adc_key_in > 770)  return btnNONE;  // This is the 1st option for speed reasons since it will be the most likely result.
 if (adc_key_in > 770)  {button = -1; return -1;}  // This is the 1st option for speed reasons since it will be the most likely result.
 if (adc_key_in < 50)   {button = 5; write_esc(); return 5;}// SINGLE test             '>' button
 if (adc_key_in < 180)  {button = 3; esc = esc + 10;  return 3;}    // UP   test number scroll '^' button
 if (adc_key_in < 355)  {button = 4; esc= esc - 10; return 4;} // DOWN test number scroll 'v' button
 if (adc_key_in < 530)  {button = 2; esc = 900; return 2;} // FAILed re-test          '>>' button
 if (adc_key_in < 770)  {screen = screen + 1; return 1;} // TEST all automatically  'TEST' button
}


