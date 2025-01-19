#include <Wire.h>
#include <LiquidCrystal.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include "model.h" // Include the generated header file for the classifier

// LCD pin configuration
#define LCD_RS 42
#define LCD_EN 40
#define LCD_D4 35
#define LCD_D5 36
#define LCD_D6 45
#define LCD_D7 48

// Potentiometer pin (controls LCD brightness)
#define POT_PIN 34

// I2C pin configuration
#define SDA_PIN 8
#define SCL_PIN 9

// Initialize LCD
LiquidCrystal lcd(LCD_RS, LCD_EN, LCD_D4, LCD_D5, LCD_D6, LCD_D7);

// Initialize MPU6050
Adafruit_MPU6050 mpu;

// Initialize the RandomForest model instance
Eloquent::ML::Port::RandomForest model;

void setup() {
  // Initialize serial communication
  Serial.begin(115200);
  Serial.println("Starting initialization...");

  // Initialize I2C pins
  Wire.begin(SDA_PIN, SCL_PIN);
  Serial.println("I2C initialized.");

  // Initialize LCD
  lcd.begin(16, 2);
  lcd.print("Initializing...");
  Serial.println("LCD initialized.");

  // Initialize MPU6050
  if (!mpu.begin(0x68)) { // Explicitly use the default I2C address
    Serial.println("Failed to find MPU6050 chip at address 0x68.");
    lcd.setCursor(0, 1);
    lcd.print("MPU6050 Error");
    while (1) {
      delay(10);
    }
  }

  // MPU6050 initialized successfully
  lcd.clear();
  lcd.print("MPU6050 Ready");
  Serial.println("MPU6050 initialized successfully!");
  delay(1000);
  lcd.clear();
}

void loop() {
  // Read data from MPU6050
  sensors_event_t a, g, temp;
  mpu.getEvent(&a, &g, &temp);

  // Normalize the feature vector
  float features[] = {
    a.acceleration.x / 10.0, a.acceleration.y / 10.0, a.acceleration.z / 10.0,
    g.gyro.x / 10.0, g.gyro.y / 10.0, g.gyro.z / 10.0
  };

  // Predict motion using the classifier
  int prediction = model.predict(features);

  // Validate the prediction index
  if (prediction < 0 || prediction >= 6) {
    Serial.println("Invalid prediction index!");
    lcd.setCursor(0, 0);
    lcd.print("Invalid Motion");
    return;
  }

  // Map the prediction to the corresponding label
  const char* labels[] = {"bench", "ohp", "dead", "squat", "row", "rest"};
  const char* motion = labels[prediction];

  // Clear the LCD line and display motion classification
  lcd.setCursor(0, 0);
  lcd.print("                ");  // Overwrite the entire line
  lcd.setCursor(0, 0);
  lcd.print("Motion: ");
  lcd.print(motion);

  // Log to Serial Monitor
  Serial.print("Predicted Motion: ");
  Serial.println(motion);

  delay(1000); // Delay for stability
}

/*void loop() {
  // Read data from MPU6050
  sensors_event_t a, g, temp;
  mpu.getEvent(&a, &g, &temp);

  // Create feature vector
  float features[] = {
    a.acceleration.x, a.acceleration.y, a.acceleration.z,
    g.gyro.x, g.gyro.y, g.gyro.z
  };

  // Predict motion using the classifier
  int prediction = model.predict(features);

  // Map the prediction to the corresponding label
  const char* labels[] = {"bench", "ohp", "dead", "squat", "row", "rest"};
  static const char* lastMotion = nullptr;
  const char* motion = labels[prediction];

  // Display motion classification on the LCD
  if (lastMotion == nullptr || strcmp(lastMotion, motion) != 0) {
    lcd.clear();  // Clears the whole LCD screen
    lcd.setCursor(0, 0);
    lcd.print("Motion: ");
    lcd.print(motion);
    lastMotion = motion;  // Update the last motion state
  }


  // Read potentiometer value and adjust LCD brightness
  int potValue = analogRead(POT_PIN);
  int brightness = map(potValue, 0, 4095, 0, 255); // Map to 0-255 PWM range
  analogWrite(LCD_D7, brightness); // Control LCD backlight

  // Send motion classification to serial monitor
  Serial.print("Predicted Motion: ");
  Serial.println(motion);

  delay(500); // Delay for stability
}*/