# Save-a-City
In this project for Northeastern's Cornerstone of Engineering, we designed a miniature city that must be saved from the hackers trying to destroy its infrastructure.

## Arduino
In blink, contains the arduino code that takes in serial input from processing (or any language with serial support) and lights up strips of LEDs based on it.
Note: FastLED Library is required which can be found [here](https://github.com/FastLED/FastLED/releases/tag/v3.0.0)

## Processing
The entire game is coded in Processing due to its easy input and visual support. There are four games that can be played: frogger, pipe rerouter, rewirer, and car unblocker. The main theme is being a CIA Agent.
Since the goal is to teach resilience as an engineering concept, we incorperate elements of cyber resilence by suggesting long passwords and 2FA.
Libraries required: processing.serial, [gifAnimation](https://github.com/01010101/GifAnimation)

Simply upload the code to arduino, connect an external power supply to the led strip (we used WS2081B) as well as the Arduino code. Then run the processing sketch.

Resistor and Capacitor semi-optional
![Wiring Diagram](https://cdn-learn.adafruit.com/assets/assets/000/030/892/medium800/leds_Wiring-Diagram.png?1456961114)
