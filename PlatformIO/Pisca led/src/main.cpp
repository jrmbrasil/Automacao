#include <Arduino.h>

/*
  Blink

  Turns an LED on for one second, then off for one second, repeatedly.

  
*/
#define LED_BUILTIN 2
 
void pisca_led();

// the setup function runs once when you press reset or power the board
void setup()
{
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
}

// the loop function runs over and over again forever
void loop()
{
  pisca_led();
}
void pisca_led()
{
  if(digitalRead(LED_BUILTIN))
  {
    digitalWrite(LED_BUILTIN,LOW);
    delay(1000);
  }
  else
  {
    digitalWrite(LED_BUILTIN,HIGH);
    delay(1000);
  }
}
