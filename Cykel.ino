#include <SimpleTimer.h>
SimpleTimer timer;

int sensorPin = 2;
boolean sensor0 = 0; 

void setup() {
  pinMode(sensorPin, INPUT);
  // initialize serial communication                                                                                  
  Serial.begin(9600);
  timer.setInterval(50, sendData);
}

void loop() {
  timer.run();
  if(digitalRead(sensorPin) == 1) {
    sensor0 = 1;
  }
}

void sendData() {
  Serial.write(sensor0);
  sensor0 = 0;
}

