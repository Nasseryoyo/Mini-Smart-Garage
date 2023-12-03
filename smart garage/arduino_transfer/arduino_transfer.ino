const int sensorPin = A0; // Analog input pin connected to IR sensor
const int outputPin = 13; // Digital output pin to control an LED or other device

int sensorValue; // Variable to store the analog sensor reading
bool objectDetected; // Flag to indicate object presence or absence

void setup() {
  pinMode(outputPin, OUTPUT); // Set output pin as output
}

void loop() {
  sensorValue = analogRead(sensorPin); // Read the analog value from the sensor

  // Apply a threshold to determine object presence
  if (sensorValue < 250) { // Adjust threshold value as needed
    objectDetected = true;
  } else {
    objectDetected = false;
  }

  // Set the output pin based on object detection
  if (objectDetected) {
    digitalWrite(outputPin, HIGH); // Turn on LED or other device
  } else {
    digitalWrite(outputPin, LOW); // Turn off LED or other device
  }
}
