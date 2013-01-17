

int c = 0;
int h;
int q;
int d = 30;
int i = 0;
int p = 0;
int myPins[] = {3, 5, 9, 10};
int mybrt[] = {0, 5, 10, 15, 20, 25, 30, 45, 30, 20, 10, 5, 0};
int mytm[] = {20, 40, 60};

void setup(){
      Serial.begin(115200);
       pinMode(7, INPUT);
        pinMode(8, INPUT);
        digitalWrite(7, HIGH);
        digitalWrite(8, HIGH);
           }
    
void loop()  {  
         
          if (digitalRead(8) == 0){
                      d = (d + 2);
                        }
           if (d > 80 ){ d = 80;}
          if (digitalRead(7) == 0){
                       d = (d - 2);
                        }
                        if (d < 5){d = 5;}
  
      for (i=0; i <= 3; i++){
    
              c = myPins[i];
                         for ( p=0; p <= 12; p++){
                               q = mybrt[p];  
                               analogWrite(c, q);
                                //flash();
                                delay(d);
                                  }
        
}
}
void flash()   {   
         //analogWrite(c, q);
         Serial.print("pin ");
      Serial.print(c);
      Serial.print(" brt ");
      Serial.println(q);
        
}    


 
