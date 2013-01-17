float volts;
int v;
int t;
int c = 0;
int h;
int q;
int d = 2;
int i = 0;
int p = 0;
int myPins[] = {3, 5, 9, 10};
int mybrt[] = {1, 1, 3, 5, 10, 20, 30, 20, 15, 10, 5, 1, 1};
int mytm[] = {20, 40, 60};

void setup(){
      Serial.begin(19200);
      pinMode(7, INPUT);
      pinMode(8, INPUT);
      digitalWrite(7, HIGH);
      digitalWrite(8, HIGH);
           }
    
void loop()  { 
  
   for (t=0; t<=10; t++){
         if(t == 1){readinpt();} 
         v = analogRead(5);
         volts = ( v * .0145 );
         flash();
         if (v < 765) {alternate(); return;}
         rotate();
}
   for (t=0; t<=5; t++){
        //if(t == 1){readinpt;}
        v = analogRead(5);
        volts = ( v * .0145 );
        flash();
        if (v < 765){alternate(); return;}
        strobe();
}}

void strobe()  {
             for ( p=0; p <= 12; p++){
              
                  q = (mybrt[p]*d);  
                      for (i=0; i <= 3; i++){
                            c = myPins[i];
                            analogWrite(c, q);
                             delay(5);
}}}
                      
void rotate()   {
               for (i=0; i <= 3; i++){
                     c = myPins[i];
                     for ( p=0; p <= 12; p++){
                         q = (mybrt[p]*d);  
                         analogWrite(c, q);
                         delay(10);
}}} 
void readinpt() {
             if (digitalRead(8) == 0){d = (d + 1);}
             if (d > 3 ){ d = 3;}
             if (digitalRead(7) == 0){d = (d - 1);}
             if (d < 0){d = 0;}
}
void alternate(){
            analogWrite(3, 20);
            analogWrite(5, 20);
            delay(500);
            analogWrite(3, 1);
            analogWrite(5, 1);
              delay(500);
            analogWrite(9, 20);
            analogWrite(10, 20);
              delay(500);
            analogWrite(9, 1);
            analogWrite(10, 1);
              delay(500);
}
void flash()   {   
         //analogWrite(c, q);
         Serial.print("analog 5 ");
         Serial.print(  volts  );
         Serial.print("   ");
      Serial.print(  v );
      Serial.print("   ");
      Serial.println(d);
      Serial.println();
      //Serial.print(" brt ");
      //Serial.println(q);
        
}    


 
