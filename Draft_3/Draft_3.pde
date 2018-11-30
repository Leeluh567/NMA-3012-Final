// mode 1 is the start screen
// mode 2 is the about page
// mode 3 is the actual work itself
int mode = 1;
// 0 is false;
boolean buttonClicked = false;
float back;

// Declare AN ARRAY OF CLOUD
Cloud[] cloudList = new Cloud[0];

import processing.sound.*;

SoundFile soundfile;
Delay delay;

void setup() {
  size (900, 750);
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
    background(255, 239, 243);
    // This is where all the title screen stuff happens
    fill(132, 12, 1);
    text("LIGHTHOUSE", width/2-40, height/2-30);
    text("PRESS #2 to go to About Page", width/2-80, height/2-0);
  }
  // About page
  else if (mode == 2) {
    background(204, 207, 229);
    fill(2, 18, 132);
    text("This piece was inspired by my fascination with the environment,", width/2-180, height/2-200);
    text("specifically coastal and nighttime ones.", width/2-100, height/2-180);

    text("Viewers will notice that while I hint at a shore or body of water,", width/2-180, height/2-150);
    text("none is actually shown. This was intentional because I wanted to", width/2-180, height/2-130);
    text("make viewers feel as if they were sailing, swimming, or being", width/2-180, height/2-110);
    text("sought out. This ties into the nighttime atmosphere because it is", width/2-180, height/2-90);
    text("around that time that perceptions and reality seem to warp. I", width/2-180, height/2-70);
    text("added clouds for this reason to make viewers feel like they were", width/2-180, height/2-50);
    text("floating or dreaming. I want them to, like in a dream, feel a sense", width/2-180, height/2-30);
    text("of control as well as a sense of structurelessness.", width/2-180, height/2-10);

    text("Additionally, using the transitions of color for the lighthouse and", width/2-180, height/2+20);
    text("the surrounding elements, I wanted to show how the same area", width/2-180, height/2+40);
    text("can look vastly different during different periods of the day. The", width/2-180, height/2+60);
    text("sketch starts off as rather simple, but as more interaction is", width/2-180, height/2+80);
    text("performed, stars and other aspects are revealed.", width/2-180, height/2+100);

    text("About me: I am a Chinese American college student from Brooklyn.", width/2-180, height/2+150);

    text("PRESS #3 to continue", width/2-50, height/2+200);

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

    fill(255, 10);
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

    //light
    fill(231, 100+mouseX/5, 59);   
    triangle(132, 75, -100+2*mouseX, 800, -300+2*mouseX, 800);
  }
}

void mousePressed() {
  // A new cloud object
  Cloud oneMore = new Cloud(color(mouseX*20 % 100, mouseX*20 % 100, mouseX*20 % 204), mouseX, mouseY, 1);
  // Make a new object at the mouse location.
  cloudList = (Cloud[]) append(cloudList, oneMore);

  // Load a soundfile
  soundfile = new SoundFile(this, "rain.aiff");

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
}