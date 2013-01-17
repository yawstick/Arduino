/*  
    Arduino thermistor example software
    Tutorial:  http://www.hacktronics.com/Tutorials/arduino-thermistor-tutorial
    Copyright (c) 2010 Mark McComb, hacktronics LLC
    License: http://www.opensource.org/licenses/mit-license.php (Go crazy)
*/

#include <LiquidCrystal.h>
#include <math.h>


LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
int backLight = 10;    // pin 10 will control the backlight
int adc_key_in = 0


void setup(void) {
  pinMode(backLight, OUTPUT);
  analogWrite(backLight, 160); // turn backlight on. Replace 'HIGH' with 'LOW' to turn it off.
  lcd.begin(16, 2);              // rows, columns.  use 16,2 for a 16x2 LCD, etc.
  lcd.clear();                   // start with a blank screen
  lcd.setCursor(0,0);            // set cursor to column 0, row 0
}



void printTemp(void) {
  double fTemp;
  double temp = analogRead(0);  // Read sensor
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("Screen 1: ");
  //lcd.setCursor(0,1);
  
  //lcd.print(temp);
  //lcd.print(" C / ");
  fTemp = (temp * 1.8) + 32.0;    // Convert to USA
  int temp2 = fTemp;
  lcd.print(temp);
  lcd.print(" F");
  int lite = (analogRead(1));
  lcd.setCursor(0,1);
  lcd.print("Lumens: ");
  lcd.print(adc_key_in);
  
 
}

void loop(void) {
  read_buttons()
  printTemp();
  delay(1000);
}



int read_buttons() //  read the buttons keyboard voltage test routine. Returns int ex: 'btnTEST' is #defined as '4'
     // button returned values centered at these values: 002, 130, 306, 478, 720 added approx 50 for buffer zone
     // use 'buttonTEST' program on seperate file to display the button values or troubleshoot
{
 adc_key_in = analogRead(0);  // read the value from the sensor for keypad and then test the value for button levels.
 delay(5); //switch debounce delay. Increase this delay if incorrect switch selections are returned.
 int k = (analogRead(0) - adc_key_in); //gives the button a slight range to allow for a little contact resistance noise
 if (5 < abs(k)) return btnNONE;  // double checks the keypress. If the two readings are not equal +/-k value after debounce delay, it tries again. if (adc_key_in > 770)  return btnNONE;  // This is the 1st option for speed reasons since it will be the most likely result.
 if (adc_key_in > 770)  return -1;  // This is the 1st option for speed reasons since it will be the most likely result.
 if (adc_key_in < 50)   return 5;// SINGLE test             '>' button
 if (adc_key_in < 180)  return 3;    // UP   test number scroll '^' button
 if (adc_key_in < 355)  return 4;  // DOWN test number scroll 'v' button
 if (adc_key_in < 530)  return 2;  // FAILed re-test          '>>' button
 if (adc_key_in < 770)  return 1;  // TEST all automatically  'TEST' button
}


