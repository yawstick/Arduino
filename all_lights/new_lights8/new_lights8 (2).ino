

int c = 0;
int h;
int q;
int d = 10;
int i = 0;
int p = 0;
int myPins[] = {3, 5, 6, 9, 10, 11};
int mybrt[] = {5, 15, 25, 35, 45, 55, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10, 5};
int mytm[] = {20, 40, 60};

void setup(){
      Serial.begin(115200);
       pinMode(12, INPUT);
        pinMode(13, INPUT);
        digitalWrite(12, HIGH);
        digitalWrite(13, HIGH);

  //  Serial.begin(115200);
   // Serial.print("Ready...     "); 
   // Serial.print("\t");
   // Serial.print("pin");
   // Serial.print("\t");
   // Serial.print("brt");
    //Serial.print("\t");
   // Serial.print("dly");
   // Serial.print("\t");
  //  Serial.println("num");
    
    }
    
void loop()  {  
  
  
   for ( p=0; p <= 17; p++){
         q = mybrt[p];  
  
  
    
    for (i=0; i <= 5; i++){
    
    c = myPins[i];
    
         analogWrite(c, q);
         
         //flash();
         delay(d);
         //    }
  }
  delay(20);
   
  }
  if (digitalRead(12) == 0){
           d = (d + 2);
             }
             if (d > 50 ){ d = 50;}
           if (digitalRead(13) == 0){
            d = (d - 2);
                  }
                if (d < 5){d = 5;}
}

void flash()   {   
         //analogWrite(c, q);
         Serial.print("pin ");
      Serial.print(c);
      Serial.print(" brt ");
      Serial.println(q);
        
}    


 
