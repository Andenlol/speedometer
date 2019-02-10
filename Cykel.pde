import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
// import the serial library
import processing.serial.*;

Robot robot;

// create an instance of the serial library
Serial myPort;

// create an instance of PImage
PImage logo;

// a variable to hold the background color
int bgcolor = 0;
int timesSinceLast = 0;
double speed = 0;
double minSpeed = 0.005;
double maxSpeed = 0.05;

void setup() {
  // set the color mode to Hue/Saturation/Brightness
  colorMode(HSB, 255);

  // load the Arduino logo into the PImage instance
  logo = loadImage("http://arduino.cc/en/pub/skins/arduinoWide/img/logo.png");

  // make the window the same size as the image
  size(500, 500);

  println("Available serial ports:");
  println(Serial.list());

  myPort = new Serial(this, Serial.list()[2], 9600);
  // port = new Serial(this, "COM1", 9600); 

  //Let's get a Robot...
  try { 
    robot = new Robot();
  } 
  catch (AWTException e) {
    e.printStackTrace();
    exit();
  }
}

void draw() {

  // if there is information in the serial port
  if ( myPort.available() > 0) {
    // read the value and store it in a variable
    bgcolor = myPort.read();

    timesSinceLast++;
    
    if ((bgcolor == 1)) {
      if (timesSinceLast > 1) {
        speed = (double) 1/timesSinceLast;
        println(speed);
        timesSinceLast = 0;
      }
    }
  }

  // draw the Arduino logo
  image(logo, 0, 0);
  
  if (bgcolor == 1) {
    background(255, (int) (((255/(maxSpeed-minSpeed))*(speed-minSpeed))), bgcolor*255);
    //pressSpace();
  }
  
}

void keyPressed() {
  //Detect space key presses (to show that it works)
  if (key == ' ') {
    println("Space!");
  }
}

void pressSpace() {
  //Press the space key
  robot.keyPress(KeyEvent.VK_SPACE);
  //If we want a delay here, that gets a little bit more complicated...
  robot.keyRelease(KeyEvent.VK_SPACE);
}