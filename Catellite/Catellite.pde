CatRocket cat;
Planet planets[];
int level;
int orbitCount;
Boolean crash;
Boolean showHelp;
Boolean landedOrbit;
PImage earthPlanet;
PImage catRocket;
PImage orbit;
int initialVelocity;
double ax; //x component of acceleration
double ay; //y component of acceleratoin
double g; //net acceleration due to gravity
double M; //mass of planet (earth)
double r; //distance from catrocket to COM of planet
double G; //universal gravitational constant
double scaleToKm; //value to scale pixels to km
double scaleToPixels; //value to scale km to pixels
int stage; //has it started to move sideways yet
double startX; // x coord of when the cat rocket started going sideways
double startY; // y coord of when the cat rocket started going sideways
int frate; //frame rate
double tv; //tangential velocity magnitude
Vector v; //velocity vector


void setup(){
    size(1080, 800); //width, height
    level = 0;
    initialVelocity = 15*60; // in km/min  (yes it's a bit weird but it's for game speed/fluidity purposes)
    cat = new CatRocket(448648, width/2-25, height/2-145);
    planets = new Planet[1];
    showHelp = false;
    stage = 0; //starts at stage 0
    landedOrbit = false;
    orbitCount = 0;
    crash = false;
    startX = 0;
    startY = 0;
    
    earthPlanet = loadImage("earth.png");  
    earthPlanet.resize(200, 190); //width, height
    catRocket = loadImage("catrocket.png");
    catRocket.resize(50, 50);
     
    planets[0] = new Earth();
    
    frate = 80;
    frameRate(frate);
    
    tv = 100*60; // in km/min
    v = new Vector(0,0);
    
    M = planets[0].getMass();
    G = 6.67*Math.pow(10,-11)*Math.pow(10,-6); //6.67*10^(-11) and then *10^(-6) to convert from being scaled by m to km

    scaleToKm = planets[0].getRadius()/95; //95 is approximately the radius of the planet in pixels
    scaleToPixels = 95/planets[0].getRadius();
}

 void draw(){
    if (!crash){
    background(0);
    image(earthPlanet, width/2-100, height/2-95);
    image(catRocket, (float)cat.getX(), (float)cat.getY());
    
    }
        //print("orbit count: " + orbitCount + "\n");
        //print("start: " + startX+ "\n");
        //print("x:" + cat.getX()+ "\n");
        //print("y:" + cat.getY()+ "\n");

    if (crash == true){
      clear();
      fill(#EA88FA);
      textSize(40);
      
      text("YOU LOST", width/2 - 70, height/2);
      rect(454, 425,  225, 50);
      fill(0);
      text("Play Again", width/2 - 75, height/2 +  60 );
      if (mousePressed && mouseX > 454 && mouseX < 679 && mouseY > 425 && mouseY < 475){
        setup();
      }
    }
      if (orbitCount >= 5){
      clear();
      fill(#EA88FA);
      textSize(40);
      
      text("YOU WON!", width/2 - 70, height/2);
      rect(454, 425,  225, 50);
      fill(0);
      text("Play Again", width/2 - 75, height/2 +  60 );
      if (mousePressed && mouseX > 454 && mouseX < 679 && mouseY > 425 && mouseY < 475){
        setup();
      }
    }
      // if statement related to distance between rocket and planet, if they overlap (doesn't need to be perfect) the player lose
    if (cat.getY() < 459  && cat.getY() > 291 && cat.getX() > 440 && cat.getX() < 590) { // if it falls into the earth the player loses
      crash = true;
    }// adjust the coordinates after moving the planet!
    if (cat.getY() < 0 || cat.getY() > 800 || cat.getX() < 0 || cat.getX() > 1080 && stage!=1){
      crash = true;
    }
    
      if (stage == 3 && (int) cat.getX() == (int) startX - 5 && cat.getY() < 350){
        orbitCount++;
      }
     

    if (stage == 1){ //STAGE 1: launch
      cat.setY(cat.getY() - initialVelocity*scaleToPixels/frate);
    }
    else if (stage == 2){ //STAGE 2: tangential velocity
      v.setX(tv*scaleToPixels/frate);
      stage = 3;
    }
    else if (stage == 3){ //STAGE 3: orbit     
      r = cat.getD()*scaleToKm; //includes radius of planet
      g = G*M/(r*r); //equation for acceleration due to gravity
      ax = -g*(cat.getX()-width/2)/r*(60*60); //acceleration(g) * y component of distance / distance <== same ratio (similar triangles)
      ay = -g*(cat.getY()-height/2)/r*(60*60); //using this ratio is a substitute for using angles/trig, basically the same thing though
        //the (60*60) is to convert s^2 to min^2
        //^^width/2 and height/2 are the coordinates of the COM of the planet, so might change
      v.setX(v.getX()+ax*scaleToPixels/frate);
      v.setY(v.getY()+ay*scaleToPixels/frate);
      cat.setY(cat.getY()+v.getY());
      cat.setX(cat.getX()+v.getX());
    }

    noFill();
    stroke(#EA88FA);
    fill(#EA88FA);
    // LAUNCH BUTTON
    rect(845, 733, 235, 67);
    // VELOCITY  BUTTON
    rect(0, 710, 350, 90);
    //HELP BUTTON
    rect(900, 0, 250, 75);
    
    // TEXTS
    fill(0);
    textSize(40);
    text("Launch", 900, 780);
    text("-", 30, 767);
    text(initialVelocity/60, 90, 765);
    text("km/s", 160, 765);
    text("+",  290,  765);
    text("Help", 950, 50);
    if (showHelp){
    fill(#EA88FA);
    textSize(20);
    text("Set your starting velocity and then launch! Then, press any key to set off the side rockets.", 10, 50);
    text("If the rocket manages to orbit the Earth a certain number of times, then you will win.", 10, 80);
    text("If the rocket hits the Earth or goes out of bounds, you lose.", 10, 110);
    text("Press the Help button again to hide this message!", 10, 140);
    }
    
    if (mousePressed) print(mouseX + "," + mouseY + "!");
 }
 
 void mousePressed(){
   if (mouseX < 81 && mouseX>0 && mouseY < 1080 && mouseY > 710){ //decrease velocity
     initialVelocity-=60;
   }
   if (mouseX < 350 && mouseX > 280 && mouseY < 1080 && mouseY > 710){ //increase velocity
     initialVelocity+=60;
   }
   
   if (mouseX > 900 && mouseY < 80){ //help
     showHelp =  !showHelp;
   }
   
   if (mouseX < 1080 && mouseX > 845 && mouseY < 800 && mouseY > 733){ //launch
     stage = 1;
   }
   
 }
 
 void keyPressed(){
   if (stage == 1)
     stage = 2;
     startX = cat.getX();
     startY = cat.getY();
 }
