/*
  Flippy brightness control
  Charles B. Malloch, PhD  2011-10-02
  
  Use a potentiometer to control the brightness of an LED
  but control the direction of brightening by sensing a 
  digital input
*/

#define pinLED 11
#define pinSense 10
#define apinPot 2

#define BAUDRATE 9600

int sense = 1;

void setup() {
  Serial.begin(BAUDRATE);
  
  pinMode(pinLED, OUTPUT);
  pinMode(pinSense, INPUT);
  digitalWrite(pinSense, HIGH);
}

void loop() {
  int counts, brightness;
  counts = analogRead(apinPot);
  sense = digitalRead(pinSense);
  if (sense == 1) {
    brightness = counts / 4;
  } else {
    brightness = 255 - counts / 4;
  }
  analogWrite(pinLED, brightness);
  Serial.print (counts);
  Serial.print (" => (");
  Serial.print (sense);
  Serial.print (") ");
  Serial.println (brightness);
  delay(100);
}
