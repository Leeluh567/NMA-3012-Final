// mode 1 is the start screen
// mode 2 is the about page
// mode 3 is the actual work itself
int mode = 1;
// 0 is false;
boolean buttonClicked = false;
float back;

int xspacing = 15;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 30.0;  // Height of wave
float period = 250.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

float theta2 = 0.02;

// The message to be displayed
//space is intentional because otherwise too close
String message = "L IGHTHOUSE --- Press #2 to continue ---";

PFont f;
// The radius of a circle
float r = 105;
// we are using this to move the circle!
float theta_offset = 0;

// Declare AN ARRAY OF CLOUD
Cloud[] cloudList = new Cloud[0];

import processing.sound.*;

SoundFile soundfile;
Delay delay;

void setup() {
  size (900, 750);
  w = width+30;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  
  // Load a soundfile
  soundfile = new SoundFile(this, "rain.aiff");
  
  // Initialize all elements of each array to zero.
  for (int i = 0; i < cloudList.length; i ++ ) {
    // The Cloud class takes in a color, a x position, a y position, and a speed)
    // We are going to give each one a random speed and a 'x' position based on i)
    // NOTE: For classes and objects, you will need to put in a "new" when you first create it for the list
    cloudList[i] = new Cloud(color(i*20 % 195, 198, 204), i*110 % width, 10, 1);
  }
}

void draw() {

  // Title Screen
  if (mode == 1) {
    background(3, 7, 114);
    // This is where all the title screen stuff happens
    f = createFont("HelveticaNeue-Italic", 35, true);
    textFont(f);
    smooth();
    frameRate(35);
    translate(width / 2, height / 2);
    fill(255, 255, 153);
    noStroke();
    ellipse(0, 0, r/2, r/2);

    fill(255, 50);
    noStroke();
    ellipse(0, 0, r, r);

    fill(255, 50);
    noStroke();
    ellipse(0, 0, r*2, r*2);

    fill(255, 50);
    noStroke();
    ellipse(0, 0, r*3, r*3);

    // We must keep track of our position along the curve
    float arclength = 0;

    // For every box
    for (int i = 0; i < message.length(); i++)
    {
      // Instead of a constant width, we check the width of each character.
      char currentChar = message.charAt(i);
      float w = textWidth(currentChar);

      // Each box is centered so we move half the width
      arclength += w/2;
      // Angle in radians is the arclength divided by the radius
      // Starting on the left side of the circle by adding PI
      float theta = PI + arclength / r;    

      pushMatrix();
      // Polar to cartesian coordinate conversion
      translate(r*cos(theta+theta_offset), r*sin(theta+theta_offset));
      // Rotate the box
      rotate(theta+PI/2+theta_offset); // rotation is offset by 90 degrees
      // Display the character
      fill(255);
      text(currentChar, 0, mouseY-400);
      popMatrix();
      // Move halfway again
      arclength += w/2;
    }
    theta_offset = theta_offset + 0.03;
  }
  // About page
  else if (mode == 2) {
    background(204, 207, 229);
    fill(2, 18, 132);
    textSize(15);
    text("This piece was inspired by the artist's fascination with the environment,", width/2-230, height/2-300);
    text("specifically coastal and nighttime ones.", width/2-230, height/2-280);

    text("Viewers will notice that while waves are shown, the greater body of", width/2-230, height/2-250);
    text("water itself is not. This was intentional because she wanted to make", width/2-230, height/2-230);
    text("viewers feel as if they were sailing, swimming, or being sought out.", width/2-230, height/2-210);
    text("This feeling of being sought out is emphasized by the lighthouse, as no", width/2-230, height/2-190);
    text("boats are actually shown, almost as if the viewers are the ones being", width/2-230, height/2-170);
    text("searched for.", width/2-230, height/2-150);

    text("The artist focused on the transition of the lighthouse and the", width/2-230, height/2-120);
    text("surrounding elements, because she wanted to show how the same", width/2-230, height/2-100);
    text("area can look vastly different during different periods of the day. The", width/2-230, height/2-80);
    text("sketch starts off as rather simple, but as more interaction is performed,", width/2-230, height/2-60);
    text("stars and other aspects are revealed.", width/2-230, height/2-40);

    text("This ties into the nighttime atmosphere because it is around that time", width/2-230, height/2-10);
    text("that perceptions and reality seem to warp. The artist added clouds for", width/2-230, height/2+30);
    text("this reason to make viewers feel like they were floating or dreaming.", width/2-230, height/2+50);
    text("She wanted them to, like in a dream, feel a sense of control as well as", width/2-230, height/2+70);
    text("a sense of structurelessness. This sense is underscored when viewers", width/2-230, height/2+90);
    text("try to add too many clouds, as they are unable to erase the clouds", width/2-230, height/2+110);
    text("unless they restart the sketch or 'wake up.'", width/2-230, height/2+130);

    text("The artist herself has never been to an actual coast with a lighthouse,", width/2-230, height/2+160);
    text("visiting such areas only in her sleep.", width/2-230, height/2+180);

    text("About the Artist: Lila Je is a Chinese American college student born", width/2-230, height/2+210);
    text("and raised in Brooklyn. As an artist, she uses her work as a means of", width/2-230, height/2+230);
    text("self-reflection and exploring the human experience. Her favorite", width/2-230, height/2+250);
    text("hobbies include drawing, watching bad movies, and sleeping.", width/2-230, height/2+270);

    text("Controls: Move and press mouse to interact. Press 'r' for sound.", width/2-230, height/2+300);

    text("PRESS #3 to continue", width/2-100, height/2+330);

    // This is where all the about page stuff like the
    // text or even an image of the creator
  }

  // The actual thing you created (your work)
  else if (mode == 3) {
    // All my work stuff happens here
    back = map(mouseX+255, 0, height, 255, 0);
    background(back, 8, 47, 147);

    //moon

    fill(255, 180);
    ellipse(750, 100, 100, 100);

    fill(255, 20);
    ellipse(750, 100, 120, 120);
    ellipse(750, 100, 140, 140);
    ellipse(750, 100, 160, 160);
    ellipse(750, 100, 180, 180);
    ellipse(750, 100, 200, 200);

    fill(back, 8, 47);
    ellipse(mouseX, 100, 100, 100);

    //lighthouse

    noStroke();
    //bottom   
    fill(237, 232, 222);
    beginShape();
    vertex(70, 400); //top left
    vertex(200, 400); //top right
    vertex(220, 550); //bottom right
    vertex(50, 550); //bottom left
    endShape(CLOSE);
    //middle
    fill(214-mouseX/10, 44, 44);
    beginShape();
    vertex(90, 250); //top left
    vertex(180, 250); //top right
    vertex(200, 400); //bottom right
    vertex(70, 400); //bottom left
    endShape(CLOSE);
    //top
    fill(237, 232, 222);
    beginShape();
    vertex(110, 100); //top left
    vertex(160, 100); //top right
    vertex(180, 250); //bottom right
    vertex(90, 250); //bottom left
    endShape(CLOSE);
    //second top rect
    fill(214-mouseX/10, 44, 44);
    rect(85, 100, 100, 30);
    //top rect
    fill(237, 232, 222);
    rect(110, 70, 50, 30);
    //top tri
    fill(214-mouseX/10, 44, 44);
    triangle(100, 70, 133, 40, 168, 70);
    //window
    fill(231, 100+mouseX/5, 59);
    rect(125, 75, 20, 20);

    drawScoop(width*0.05, height*0.9, 40, 5);
    drawScoop(width*0.2, height*0.92, 40, 5);
    drawScoop(width*0.35, height*0.94, 200, 4);
    drawScoop(width*0.5, height*0.96, 200, 4);
    drawScoop(width*0.65, height*0.98, 300, 10);
    drawScoop(width*0.8, height*0.99, 40, 5);
    drawScoop(width*0.95, height*1, 200, 4);

    fill(214-mouseX/5, 201-mouseX/5, 57);
    quad(0, 550, 900, 625, 900, 800, 40, 750);

    drawStar(width*0.05, height*0.37);
    drawStar(width*0.5, height*0.11);
    drawStar(width*0.1, height*0.05);
    drawStar(width*0.26, height*0.2);
    drawStar(width*0.42, height*0.27);
    drawStar(width*0.59, height*0.34);
    drawStar(width*0.8, height*0.43);
    drawStar(width*0.36, height*0.6);
    drawStar(width*0.72, height*0.7);
    drawStar(width*0.57, height*0.56);
    drawStar(width*0.35, height*0.458);

    for (int i = 0; i < cloudList.length; i ++ ) {
      cloudList[i].move();
      cloudList[i].display();
      cloudList[i].bounce();
    }

    calcWave();
    renderWave();

    //light
    fill(231, 100+mouseX/5, 59);  
    triangle(132, 75, -100+2*mouseX, 800, -300+2*mouseX, 800);
  }
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    fill(143, 202, 239);
    ellipse(x*xspacing, height-40+yvalues[x], 20, 20);
    ellipse(x*xspacing, height-30+yvalues[x], 20, 20);
    fill(57, 117, 155);
    ellipse(x*xspacing, height-20+yvalues[x], 20, 20);
    ellipse(x*xspacing, height-10+yvalues[x], 20, 20);
    ellipse(x*xspacing, height+yvalues[x], 20, 20);
    fill(3, 71, 114);
    ellipse(x*xspacing, height+10+yvalues[x], 20, 20);
    ellipse(x*xspacing, height+20+yvalues[x], 20, 20);
    ellipse(x*xspacing, height+30+yvalues[x], 20, 20);
  }
}

void mousePressed() {
  // A new cloud object
  Cloud oneMore = new Cloud(color(mouseX*20 % 100, mouseX*20 % 100, mouseX*20 % 204), mouseX, mouseY, 1);
  // Make a new object at the mouse location.
  cloudList = (Cloud[]) append(cloudList, oneMore);
  

  theta += theta2 + 0.02;
  theta2 = theta2+0.02;
}

void drawScoop(float xloc, float yloc, int size, int num) {
  fill(155-mouseX/5, 146-mouseX/5, 40);
  ellipse(xloc, yloc, 300, 300);
  fill(214-mouseX/5, 201-mouseX/5, 57);
  ellipse(xloc+10, yloc+10, 300, 300);
}
void drawStar(float xloc, float yloc) {
  fill(163+mouseX/2, 9+mouseX/2, 47+mouseX/2);
  ellipse(xloc, yloc, 3, 3);
}

//void keyPressed() {
//  if (mouseX > 10 && mouseX < width &&
//    mouseY > 10 && mouseY < height) {

//    buttonClicked = !buttonClicked;
//  }
//}

void keyPressed() {
  if (key == '1') {
    mode = 1;
  } else if (key == '2') {
    mode = 2;
  } else if (key == '3') {
    mode = 3;
  }
  if (key == 'r') {
    // Create the delay effect
    delay = new Delay(this);

    // Play the file in a loop
    soundfile.loop();

    // Connect the soundfile to the delay unit, which is initiated with a
    delay.process(soundfile, 1.0);

    float position = map(mouseX, 0, width, -1.0, 1.0);
    soundfile.pan(position);

    // Map mouseX from 0 to 0.8 for the amount of delay feedback
    float fb = map(mouseX, 0, width, 0.0, 0.8);
    delay.feedback(fb);

    // Map mouseY from 0.001 to 2.0 seconds for the length of the delay
    float delayTime = map(mouseY, 0, height, 0.001, 2.0);
    delay.time(delayTime);
  }
}
