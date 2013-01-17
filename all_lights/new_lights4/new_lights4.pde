int x;
int z;
int t= 15;
int w= 5;
int c;
int y;
int h;
int q;
int d = 0;
int myPins[] = {3, 5, 6, 9, 10, 11};
int mybrt[] = {10, 60, 120, 0, 30};
int mytm[] = {30, 60, 90};

void setup(){
    Serial.begin(115200);
    Serial.print("Ready...     "); 
    Serial.print("\t");
    Serial.print("pin");
    Serial.print("\t");
    Serial.print("brt");
    Serial.print("\t");
    Serial.print("dly");
    Serial.print("\t");
    Serial.println("num");
    
    }
    
void loop()  {  
   y = analogRead(0);
   int mr = random(0, 5);
   int mt = random(0, 3);
   int mp = random(0, 6);
   h = map(y, 1, 1024, 5, 1000);
   z = mytm[mt];
   c = myPins[mp];
   q = mybrt[mr];
   myprint();
   flash();
   
}

void flash()   {     
         analogWrite(c, q);
         delay(z);
         d = d+1;
         delay(y);
}    

void mymap(){
   h = map(y, 1, 1024, -128, 128);
 
}

void myprint(){
      Serial.print("analog read = ");
      Serial.print("\t");
      Serial.print(c);
      Serial.print("\t");
      Serial.print(q);
      Serial.print("\t");
      Serial.print(z);
      Serial.print("\t");
      Serial.println(d);

}
 
