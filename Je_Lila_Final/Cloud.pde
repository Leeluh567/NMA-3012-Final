// Define a class outside of setup and draw.
class Cloud {
  // Variables.
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  int last_rain;
  int rain_pass;
  int y = 0;

  // A constructor.
  Cloud(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    last_rain = millis();
    rain_pass = 7000;
  }

  // Function.
  void display() {
    // The cloud is just a ellipse
    fill(c);
    noStroke();
    noLoop();
    ellipse(xpos+40, ypos+40, 55, 55);
    ellipse(xpos+80, ypos+30, 55, 55);
    ellipse(xpos+120, ypos+45, 55, 55);
    ellipse(xpos+80, ypos+55, 170, 40);

    if(millis() > last_rain + rain_pass){
      last_rain = millis();
      y = 0;
    }
   
    //if(y + ypos > height){
    //  y = 0;
    //}

    loop();
    fill(random(6, 95), random(48, 104), random(99, 127));
    rect(xpos+30, y+ypos+60, 5, 30);
    fill(4, 59, 147);
    rect(xpos+20, y+ypos+80, 5, 30);
    fill(random(6, 95), random(48, 104), random(99, 127));
    rect(xpos+60, y+ypos+70, 5, 30);
    fill(4, 59, 147);
    rect(xpos+70, y+ypos+90, 5, 30);
    fill(random(6, 95), random(48, 104), random(99, 127));
    rect(xpos+60, y+ypos+110, 5, 30);
    fill(4, 59, 147);
    rect(xpos+80, y+ypos+100, 5, 30);
    fill(random(6, 95), random(48, 104), random(99, 127));
    rect(xpos+100, y+ypos+70, 5, 30);
    fill(4, 59, 147);
    rect(xpos+110, y+ypos+80, 5, 30);
    fill(random(6, 95), random(48, 104), random(99, 127));
    rect(xpos+120, y+ypos+110, 5, 30);
    fill(4, 59, 147);
    rect(xpos+140, y+ypos+70, 5, 30);
    fill(random(6, 95), random(48, 104), random(99, 127));
    rect(xpos+150, y+ypos+80, 5, 30);

    y = y + 1;
    if (y < 0) {
      y = height;
    }
  }

  void bounce() {
    // If we’ve reached an edge, reverse speed
    if ((xpos > width) || (xpos < 0)) {
      xspeed = xspeed * - 1;
    }
    //if ((ypos > height) || (ypos < 0)) {
    //  yspeed = yspeed * - 1;
    //}
  }

  // Function. 
  void move() {
    xpos = xpos + xspeed;
    //ypos = ypos + yspeed;
  }
}
