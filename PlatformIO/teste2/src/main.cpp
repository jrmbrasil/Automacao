#include <Arduino.h>

void setup() 
{
  // put your setup code here, to run once:
 Serial.begin(9600);
  Serial.println("Hello, ESP32!");
  pinMode(2, OUTPUT);
  pinMode(4, INPUT);
}

void loop() 
{
  // put your main code here, to run repeatedly:
  if(digitalRead(4)==false)
  {
    digitalWrite(2, LOW);
    while(digitalRead(4)==true);
  }
  else
  { 
    digitalWrite(2, HIGH);
    while(digitalRead(4)==false);
  }
  
}

