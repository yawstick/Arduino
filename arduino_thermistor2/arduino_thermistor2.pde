/*  
    Arduino thermistor example software
    Tutorial:  http://www.hacktronics.com/Tutorials/arduino-thermistor-tutorial
    Copyright (c) 2010 Mark McComb, hacktronics LLC
    License: http://www.opensource.org/licenses/mit-license.php (Go crazy)
*/

#include <LiquidCrystal.h>
#include <math.h>

/*
See tutorial for Thermistor connections

LCD Connections:
rs (LCD pin 4) to Arduino pin 12
rw (LCD pin 5) to Arduino pin 11
enable (LCD pin 6) to Arduino pin 10
LCD pin 15 to Arduino pin 13
LCD pins d4, d5, d6, d7 to Arduino pins 5, 4, 3, 2
*/

LiquidCrystal lcd(10, 11, 12, 8, 7, 2, 4);
int backLight = 3;    // pin 13 will control the backlight



void setup(void) {
  pinMode(backLight, OUTPUT);
  analogWrite(backLight, 64); // turn backlight on. Replace 'HIGH' with 'LOW' to turn it off.
  lcd.begin(20, 4);              // rows, columns.  use 16,2 for a 16x2 LCD, etc.
  lcd.clear();                   // start with a blank screen
  lcd.setCursor(0,0);            // set cursor to column 0, row 0
}

double Thermister(int RawADC) {
  double Temp;
  // See http://en.wikipedia.org/wiki/Thermistor for explanation of formula
  Temp = log(((10240000/RawADC) - 10000));
  Temp = 1 / (0.001129148 + (0.000234125 * Temp) + (0.0000000876741 * Temp * Temp * Temp));
  Temp = Temp - 273.15;           // Convert Kelvin to Celcius
  return Temp;
}

void printTemp(void) {
  double fTemp;
  double temp = Thermister(analogRead(0));  // Read sensor
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("Temp Outside: ");
  //lcd.setCursor(0,1);
  
  //lcd.print(temp);
  //lcd.print(" C / ");
  fTemp = (temp * 1.8) + 32.0;    // Convert to USA
  int temp2 = fTemp;
  lcd.print(temp2);
  lcd.print(" F");
  int lite = (analogRead(1));
  lcd.setCursor(0,1);
  lcd.print("Lumens: ");
  lcd.print(lite);
  
  if (fTemp > 68 && fTemp < 78) {
    lcd.setCursor(0,3);
    lcd.print("Very comfortable");
  }
}

void loop(void) {
  printTemp();
  delay(1000);
  
}


