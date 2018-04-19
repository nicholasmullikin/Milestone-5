#include "FastLED.h"

// How many leds in your strip?
#define NUM_LEDS_1 3 //crosswalk
#define NUM_LEDS_2 24 //road
#define NUM_LEDS_3 3 //other_building
#define NUM_LEDS_4 9 //water tower
#define NUM_LEDS_5 4 //building
#define NUM_LEDS_6 8 //power_plant


#define DATA_PIN_1 2
#define DATA_PIN_2 3
#define DATA_PIN_3 4
#define DATA_PIN_4 5
#define DATA_PIN_5 6
#define DATA_PIN_6 7



// Define the array of leds
CRGB crosswalk[NUM_LEDS_1];
CRGB road[NUM_LEDS_2];
CRGB other_building[NUM_LEDS_3];
CRGB water_tower[NUM_LEDS_4];
CRGB building[NUM_LEDS_5];
CRGB power_plant[NUM_LEDS_6];

void setup() {


  Serial.begin(9600);
  FastLED.setBrightness( 100 );
  FastLED.addLeds<WS2812B, DATA_PIN_1, GRB>(crosswalk, NUM_LEDS_1);
  FastLED.addLeds<WS2812B, DATA_PIN_2, GRB>(road, NUM_LEDS_2);
  FastLED.addLeds<WS2812B, DATA_PIN_3, GRB>(other_building, NUM_LEDS_3);
  FastLED.addLeds<WS2812B, DATA_PIN_4, GRB>(water_tower, NUM_LEDS_4);
  FastLED.addLeds<WS2812B, DATA_PIN_5, GRB>(building, NUM_LEDS_5);
  FastLED.addLeds<WS2812B, DATA_PIN_6, GRB>(power_plant, NUM_LEDS_6);

}
String str;
void loop() {
  if (Serial.available() > 0)
  {
    str = Serial.readStringUntil('\n');


    int cI = str.indexOf(','); // comma index
    int cI2 = str.indexOf(',', cI + 1);
    int cI3 = str.indexOf(',', cI2 + 1);
    int cI4 = str.indexOf(',', cI3 + 1);
    int cI5 = str.indexOf(',', cI4 + 1);

    String x = str.substring(0, cI);
    String start = str.substring(cI + 1, cI2);
    String end_ = str.substring(cI2 + 1, cI3);
    String r = str.substring(cI3 + 1, cI4);
    String g = str.substring(cI4 + 1, cI5);
    String b = str.substring(cI5 + 1); //To the end of the string

    Serial.println("X: " + x + " Start: " + start + " End: " + end_ + " Red: " + r + " Green: " + g + " Red: " + b);
    lightLEDStrip(atoi(x.c_str()), atoi(start.c_str()), atoi(end_.c_str()), atoi(r.c_str()),  atoi(g.c_str()), atoi(b.c_str()));

  }
  delay(50);
}

void lightLEDStrip(int x, int start, int end_, int r, int g, int b) {
  if (start < 0) {
    start = 0;
  }
  if (x == 1) {
    if (end_ > NUM_LEDS_1) {
      end_ = NUM_LEDS_1;
    }
    for (int i = start; i < end_; i++) {
      crosswalk[i].setRGB(r, g, b);
      FastLED.show();
    }
  }
  if (x == 2) {
    if (end_ > NUM_LEDS_2) {
      end_ = NUM_LEDS_2;
    }
    for (int i = start; i < end_; i++) {
      road[i].setRGB(r, g, b);
      FastLED.show();
    }
  }
  if (x == 3) {
    if (end_ > NUM_LEDS_3) {
      end_ = NUM_LEDS_3;
    }
    for (int i = start; i < end_; i++) {
      other_building[i].setRGB(r, g, b);
      FastLED.show();
    }
  }
  if (x == 4) {
    if (end_ > NUM_LEDS_4) {
      end_ = NUM_LEDS_4;
    }
    for (int i = start; i < end_; i++) {
      water_tower[i].setRGB(r, g, b);
      FastLED.show();
    }
  }
  if (x == 5) {
    if (end_ > NUM_LEDS_5) {
      end_ = NUM_LEDS_5;
    }
    for (int i = start; i < end_; i++) {
      building[i].setRGB(r, g, b);
      FastLED.show();
    }
  }
  if (x == 6) {
    if (end_ > NUM_LEDS_6) {
      end_ = NUM_LEDS_6;
    }
    for (int i = start; i < end_; i++) {
      power_plant[i].setRGB(r, g, b);
      FastLED.show();
    }
  }
}

void setAllToBlack() {
  for (int i = 0; i < NUM_LEDS_1; i++) {
    road[i].setRGB(0, 0, 0);
    FastLED.show();
  }
  for (int i = 0; i < NUM_LEDS_2; i++) {
    crosswalk[i].setRGB(0, 0, 0);
    FastLED.show();
  }
  for (int i = 0; i < NUM_LEDS_3; i++) {
    water_tower[i].setRGB(0, 0, 0);
    FastLED.show();
  }
  for (int i = 0; i < NUM_LEDS_4; i++) {
    building[i].setRGB(0, 0, 0);
    FastLED.show();
  }
  for (int i = 0; i < NUM_LEDS_5; i++) {
    power_plant[i].setRGB(0, 0, 0);
    FastLED.show();
  }
}

