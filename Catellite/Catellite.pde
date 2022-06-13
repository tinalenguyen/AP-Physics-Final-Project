//VERY IMPORTANT: fix issues with where planet is placed. affects px and py in catrocket which is important

CatRocket cat;
Planet planets[];
int level;
int orbitCount;
Boolean crash;
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
    //background(0);
    level = 0;
    initialVelocity = 15*60; // in km/min  (yes it's a bit weird but it's for game speed/fluidity purposes)
    cat = new CatRocket(448648, width/2-25, height/2-145);
    planets = new Planet[1];
    stage = 1; //starts at stage 1
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
    
    frate = 60;
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
      // if statement related to distance between rocket and planet, if they overlap (doesn't need to be perfect) the player lose
    if (cat.getY() < 476  && cat.getY() > 308 && cat.getX() > 410 && cat.getX() < 560) { // if it falls into the earth the player loses
       crash = true;
    }// adjust the coordinates after moving the planet!
    
      if (stage == 3 && (int) cat.getX() == (int) startX - 10 && cat.getY() > height/2){
        orbitCount++;
      }
     

    if (stage == 1) //STAGE 1
      cat.setY(cat.getY() - initialVelocity*scaleToPixels/frate);//initialVelocity is too fast, need to adjust pixels and meters
    else if (stage == 2){ //STAGE 2
      v.setX(tv*scaleToPixels/frate);
      stage = 3;
    }
    else{ //STAGE 3      
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
    
    // TEXTS
    fill(0);
    textSize(40);
    text("Launch", 900, 780);
    text("-", 30, 767);
    text(initialVelocity/60, 90, 765);
    text("km/s", 160, 765);
    text("+",  290,  765);
      
  
    
    if (mousePressed) print(mouseX + "," + mouseY + "!");
 }
 
 void mousePressed(){
   if (mouseX < 81 && mouseX>0 && mouseY < 1080 && mouseY > 710){
     initialVelocity+=60;
   }
   if (mouseX < 350 && mouseX > 280 && mouseY < 1080 && mouseY > 710){
     initialVelocity+=60;
   }
   
 }
 
 void keyPressed(){
   if (stage == 1)
     stage = 2;
     startX = cat.getX();
     startY = cat.getY();
 }
