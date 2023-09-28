#include <SoftwareSerial.h>

SoftwareSerial hc06(2, 3);

//float sensor_val=0;

void setup()
{
  // initialize digital pin RX as an input.
  // pinMode(2, INPUT);
  // initialize digital pin TX as an output.
  // pinMode(3, OUTPUT);
  //Initialize Serial Monitor
  Serial.begin(9600);
  Serial.println("ENTRE Comandos AT:");
  //Initialize Bluetooth Serial Port
  hc06.begin(9600);
}

void loop()
{
  //Write data from HC06 to Serial Monitor
  if (hc06.available())
  {
    Serial.write(hc06.read());
  }

  // Simulate sensor measurement
  //sensor_val=0;//(float)random(256); // random number between 0 and 255

  //Write sensor data to HC06
  // hc06.print(sensor_val);

  //Write from Serial Monitor to HC06
  if (Serial.available())
  {
    hc06.write(Serial.read());
  }
}
