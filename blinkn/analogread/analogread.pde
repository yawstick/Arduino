
void setup()
    {
 Serial.begin(9600);
  Serial.println("Ready...");     
      
    }
    
    void loop(){
      int y = analogRead(0);
      int z = (y / 4);
      analogWrite(11, z);
      delay(250);
      Serial.print("analog read = ");
      Serial.print(y);
      Serial.print("  ");
      Serial.println(z);
           
    }
