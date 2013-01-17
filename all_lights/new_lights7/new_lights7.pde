int x;
int z;
int t= 15;
int w= 5;
int c;
int y = 25 ;
int h;
int q;
int d = 0;
int myPins[] = {3, 5, 6, 9, 10, 11};
int mybrt[] = {30, 10, 120, 5, 75, 175};
int mytm[] = {20, 40, 60};

void setup(){
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
   //y = analogRead(0);
   int mr = random(0, 6);
   int mt = random(0, 3);
   int mp = random(0, 6);
   //h = map(y, 1, 1024, 5, 1000);
   z = mytm[mt];
   c = myPins[mp];
   q = mybrt[mr];
   //myprint();
   flash();
   
}

void flash()   {     
         analogWrite(c, q);
         delay(z);
         d = d+1;
         delay(y);
}    


 
